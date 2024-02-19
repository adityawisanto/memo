import 'package:memo/packages/packages.dart';

abstract class StatusSource {
  Future<StatusModel> getCurrentStatus(
    String? type,
  );

  Future<String> postCurrentStatus(
    int? idTicket,
    int? idStatus,
    int? idStatusDetail,
    String? statusTicket,
    String? notes,
  );
}

class StatusSourceImpl implements StatusSource {
  final Dio dio;

  StatusSourceImpl({
    required this.dio,
  });

  @override
  Future<StatusModel> getCurrentStatus(
    String? type,
  ) async {
    try {
      if (await CustomInternet().checked()) {
        final response = await dio.get(
          CustomEnv().env("STATUS_TICKET"),
          queryParameters: {
            "type": type,
          },
        );

        await StatusTable().truncateStatus();

        List<Map<String, dynamic>> responseData =
            List<Map<String, dynamic>>.from(response.data['body']);

        List<DataStatusModel> dataStatusList = [];

        for (var statusData in responseData) {
          if (statusData.containsKey('detailStatus') &&
              statusData['detailStatus'] != null) {
            List<Map<String, dynamic>> detailStatusList =
                List<Map<String, dynamic>>.from(statusData['detailStatus']);

            List<DataStatusModel> detailStatusModels = detailStatusList
                .map((detail) => DataStatusModel(
                      idStatus: statusData['idStatus'],
                      titleStatus: statusData['titleStatus'],
                      idDetailStatus: detail['idDetailStatus'],
                      detailStatus: detail['nameDetailStatus'],
                    ))
                .toList();

            dataStatusList.addAll(detailStatusModels);
          }
        }

        for (var data in dataStatusList) {
          await StatusTable().createStatus(data);
        }

        return await StatusTable().getStatus();
      } else {
        return await StatusTable().getStatus();
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        throw ServerException(e.response?.data["error"]);
      } else {
        throw const ServerException(CustomResponse.serverBusy);
      }
    }
  }

  @override
  Future<String> postCurrentStatus(
    int? idTicket,
    int? idStatus,
    int? idStatusDetail,
    String? statusTicket,
    String? notes,
  ) async {
    try {
      final response = await dio.post(
        "/api/v1/update-ticket-status",
        data: {
          "ticket_id": idTicket,
          "idStatus": idStatus,
          "idStatusDetail": idStatusDetail,
          "status_ticket": statusTicket,
          "notes": notes,
        },
      );

      return response.data.toString();
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        throw ServerException(e.response?.data["error"]);
      } else {
        throw const ServerException(CustomResponse.serverBusy);
      }
    }
  }
}
