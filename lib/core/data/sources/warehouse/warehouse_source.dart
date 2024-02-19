import 'package:memo/packages/packages.dart';

abstract class WarehouseSource {
  Future<WarehouseModel> getCurrentWarehouse();
}

class WarehouseSourceImpl implements WarehouseSource {
  final Dio dio;

  WarehouseSourceImpl({
    required this.dio,
  });

  @override
  Future<WarehouseModel> getCurrentWarehouse() async {
    try {
      if (await CustomInternet().checked()) {
        final response = await dio.get(
          CustomEnv().env("USER_ITEM"),
        );

        await WarehouseTable().truncateWarehouse();

        insertP1(response.data);

        insertP2(response.data);

        for (int i = 0; i < response.data["item"].length; i++) {
          final item = DataWarehouseModel(
            idStock: response.data["item"][i]["ID"],
            type: response.data["item"][i]["ItemName"],
            total: response.data["item"][i]["Qty"],
            category: "Item",
            def: 0,
            dataSn: const [],
          );
          await WarehouseTable().createWarehouse(item);
        }

        return await WarehouseTable().getWarehouse();
      } else {
        return await WarehouseTable().getWarehouse();
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        throw ServerException(e.response?.data["error"]);
      } else {
        throw const ServerException(CustomResponse.serverBusy);
      }
    }
  }

  Future<void> insertP1(
    dynamic data,
  ) async {
    final List<WarehouseSnModel> dataSn = [];

    for (int i = 0; i < data["P1"].length; i++) {
      dataSn.add(
        WarehouseSnModel(
          idSn: data["P1"][i]["ID"],
          type: "EDC P1",
          sn: data["P1"][i]["sn"],
        ),
      );
    }

    final p1 = DataWarehouseModel(
      idStock: 1,
      type: "EDC P1",
      category: "EDC P1",
      total: data["P1"].length,
      def: 0,
      dataSn: dataSn,
    );

    await WarehouseTable().createWarehouse(p1);
  }

  Future<void> insertP2(
    dynamic data,
  ) async {
    final List<WarehouseSnModel> dataSn = [];

    for (int i = 0; i < data["P2"].length; i++) {
      dataSn.add(
        WarehouseSnModel(
          idSn: data["P2"][i]["ID"],
          type: "EDC P2",
          sn: data["P2"][i]["sn"],
        ),
      );
    }

    final p2 = DataWarehouseModel(
      idStock: 2,
      type: "EDC P2",
      category: "EDC P2",
      total: data["P2"].length,
      def: 0,
      dataSn: dataSn,
    );

    await WarehouseTable().createWarehouse(p2);
  }
}
