import 'package:memo/packages/packages.dart';

abstract class SummarySource {
  Future<SummaryStatisticModel> getCurrentStatistic(
    String? startDate,
    String? endDate,
  );
}

class SummarySourceImpl implements SummarySource {
  final Dio dio;

  SummarySourceImpl({
    required this.dio,
  });

  @override
  Future<SummaryStatisticModel> getCurrentStatistic(
    String? startDate,
    String? endDate,
  ) async {
    try {
      if (await CustomInternet().checked()) {
        final response = await dio.get(
          CustomEnv().env("SUMMARY"),
          queryParameters: {
            "start_date": startDate,
            "end_date": endDate,
          },
        );

        await StatisticTable().truncateStatistic();

        final inSla = response.data["data"]["in_sla"];
        final outSla = response.data["data"]["out_sla"];
        final tickets = response.data["data"]["tickets"];

        if (tickets.isNotEmpty) {
          for (var item in tickets) {
            await StatisticTable().createStatistic(
              SummaryDataStatisticModel(
                installType: item["InstallType"],
                idStatusTicket: item["StatusTicketId"],
                total: item["Count"],
                inSla: inSla,
                outSla: outSla,
              ),
            );
          }
        }

        return await StatisticTable().getStatistic();
      } else {
        return await StatisticTable().getStatistic();
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
