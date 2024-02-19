import 'package:memo/packages/packages.dart';

abstract class ReportSource {
  Future<ReportModel> getCurrentReport();
}

class ReportSourceImpl implements ReportSource {
  final Dio dio;

  ReportSourceImpl({
    required this.dio,
  });

  @override
  Future<ReportModel> getCurrentReport() async {
    try {
      if (await CustomInternet().checked()) {
        final response = await dio.get(
          CustomEnv().env("LKM_HISTORY"),
        );

        await ReportTable().truncateReport();

        final data = response.data["data"];

        if (data != null) {
          for (int i = 0; i < data.length; i++) {
            List<ReportItemModel> reportItem = [];
            List<DataReportModel> dataReport = [];

            if (data[i]["LKMItem"].isNotEmpty) {
              for (int j = 0; j < data[i]["LKMItem"].length; j++) {
                final dataLkmItem = data[i]["LKMItem"];
                final lkmItem = ReportItemModel(
                  id: data[i]["ID"],
                  name: dataLkmItem[j]["Item"]["name"],
                  sn: "",
                  qty: dataLkmItem[j]["Qty"],
                );

                reportItem.add(lkmItem);
              }
            }

            if (data[i]["Inventory"] != null) {
              final idEdc = data[i]["Inventory"]["inventory_type_id"];
              final sn = "(${data[i]["Inventory"]["sn"]})";

              final edc = idEdc == 1 ? "P1" : "P2";

              final lkmItem = ReportItemModel(
                id: data[i]["ID"],
                name: edc,
                sn: sn,
                qty: 1,
              );

              reportItem.add(lkmItem);

              final lkmHeader = DataReportModel(
                id: data[i]["ID"],
                createdAt: data[i]["CreatedAt"],
                installType: data[i]["Ticket"]["install_type"],
                qty: reportItem.length,
                reportItem: reportItem,
              );
              dataReport.add(lkmHeader);
            } else {
              final lkmHeader = DataReportModel(
                id: data[i]["ID"],
                createdAt: data[i]["CreatedAt"],
                installType: data[i]["Ticket"]["install_type"],
                qty: reportItem.length,
                reportItem: reportItem,
              );

              if (reportItem.isNotEmpty) {
                dataReport.add(lkmHeader);
              }
            }

            for (var item in reportItem) {
              await ReportTable().createReportItem(
                item,
              );
            }

            for (var item in dataReport) {
              await ReportTable().createReport(
                item,
              );
            }
          }
        }

        return await ReportTable().getReport();
      } else {
        return await ReportTable().getReport();
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
