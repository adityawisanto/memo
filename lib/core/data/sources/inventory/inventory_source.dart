import 'package:memo/packages/packages.dart';

abstract class InventorySource {
  Future<InventoryModel> getCurrentInventory(
    String? type,
  );
}

class InventorySourceImpl implements InventorySource {
  final Dio dio;
  final CustomPreferences customPreferences;

  InventorySourceImpl({
    required this.dio,
    required this.customPreferences,
  });

  @override
  Future<InventoryModel> getCurrentInventory(
    String? type,
  ) async {
    try {
      if (await CustomInternet().checked()) {
        await InventoryTable().truncateInventory();

        String? url;
        String? invTypeId;

        final idUser = await customPreferences.getIdUser();

        if (type == "EDC P1" || type == "EDC P2") {
          String edcType = type == "EDC P1" ? "1" : "2";
          url =
              "${CustomEnv().env("INVENTORY_PARAM")}$idUser${CustomEnv().env("INVENTORY_TYPE")}$edcType";
        } else {
          invTypeId = type.toString() == "Kabel USB"
              ? "1"
              : type.toString() == "Thermal paper"
                  ? "2"
                  : type.toString() == "Stiker EDC"
                      ? "3"
                      : type.toString() == "Rak Besi"
                          ? "4"
                          : type.toString() == "Manual Book"
                              ? "5"
                              : "0";
          url =
              "${CustomEnv().env("ITEM_HISTORY")}$invTypeId${CustomEnv().env("TARGET_USER")}$idUser${CustomEnv().env("TARGET_USER")}";
        }
        final response = await dio.get(
          url.toString(),
        );

        for (var item in response.data["data"]) {
          final isEdc =
              item["inventory_type_id"] == 1 || item["inventory_type_id"] == 2;
          if (isEdc) {
            await InventoryTable().createInventory(
              DataInventoryModel(
                sn: item["sn"],
                qty: 0,
                status: item["status"],
                date: item["CreatedAt"],
              ),
            );
          } else {
            await InventoryTable().createInventory(
              DataInventoryModel(
                sn: "${item["SourceSp"] != null ? item["SourceSp"]["name"] : item["SourceUser"] != null ? item["SourceUser"]["name"] : item["SourceLkm"]["Ticket"]["subtiket_id"]}",
                qty: item["qty"],
                status: "in",
                date: item["CreatedAt"],
              ),
            );
            final reduction = await dio.get(
                "/master/item_history?param=item_id:$invTypeId,source_user_id:$idUser&order=created_at:-1&page_size=100");

            for (var item in reduction.data["data"]) {
              await InventoryTable().createInventory(
                DataInventoryModel(
                  sn: "${item["TargetSp"] != null ? item["TargetSp"]["name"] : item["TargetUser"] != null ? item["TargetUser"]["name"] : item["TargetLkm"]["Ticket"]["subtiket_id"]}",
                  qty: item["qty"],
                  status: "out",
                  date: item["CreatedAt"],
                ),
              );
            }
          }
        }
        return await InventoryTable().getInventory();
      } else {
        return await InventoryTable().getInventory();
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        throw ServerException(e.response?.data["error"]);
      } else {
        throw const ServerException(CustomResponse.serverBusy);
      }
    }
  }
}
