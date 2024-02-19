import 'package:memo/packages/packages.dart';

abstract class TicketSource {
  Future<TicketModel> getCurrentTicket(
    String? type,
    String? params,
    String? search,
    String? startDate,
    String? endDate,
    String? dateField,
    int? page,
    int? limit,
  );

  Future<String> postCurrentTicket(
    int? idTicket,
  );
}

class TicketSourceImpl implements TicketSource {
  final Dio dio;
  final CustomPreferences customPreferences;

  TicketSourceImpl({
    required this.dio,
    required this.customPreferences,
  });

  @override
  Future<TicketModel> getCurrentTicket(
    String? type,
    String? params,
    String? search,
    String? startDate,
    String? endDate,
    String? dateField,
    int? page,
    int? limit,
  ) async {
    try {
      if (await CustomInternet().checked()) {
        final response = await dio.get(
          CustomEnv().env("TICKET"),
          queryParameters: type == "ticket"
              ? {
                  "param": params == ""
                      ? "status_admin_id:1,status_ticket_id:1-2"
                      : params,
                  "search": search,
                  "date_field": dateField,
                  "page": page,
                  "page_size": limit,
                }
              : type == "history"
                  ? {
                      "param": "status_ticket_id:3-8",
                      "start_date": startDate,
                      "end_date": endDate,
                      "date_field": dateField,
                      "page": page,
                      "page_size": limit,
                    }
                  : {},
        );

        await TicketTable().truncateTicket();

        final ticket = List<DataTicketModel>.from(
          response.data["data"].map(
            (x) => DataTicketModel.fromJson(x),
          ),
        );
        for (var item in ticket) {
          await TicketTable().createTicket(
            item,
          );
        }

        return await TicketTable().getTicket();
      } else {
        return await TicketTable().getTicket();
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
  Future<String> postCurrentTicket(
    int? idTicket,
  ) async {
    try {
      final response = await dio.post(
        CustomEnv().env("PIN_TICKET"),
        data: {
          "ticket_id": idTicket,
        },
      );

      return response.data["pinned"].toString();
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        throw ServerException(e.response?.data["error"]);
      } else {
        throw const ServerException(CustomResponse.serverBusy);
      }
    }
  }
}
