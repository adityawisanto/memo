import 'package:memo/packages/packages.dart';

abstract class AssignSource {
  Future<String> postCurrentAssign(
    int? idAssign,
    String? status,
  );
}

class AssignSourceImpl implements AssignSource {
  final Dio dio;

  AssignSourceImpl({
    required this.dio,
  });

  @override
  Future<String> postCurrentAssign(
    int? idAssign,
    String? status,
  ) async {
    try {
      final response = await dio.post(
        CustomEnv().env("UPDATE_STATUS"),
        data: {
          "id": idAssign,
          "status": status,
        },
      );

      return response.data["msg"];
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        throw ServerException(e.response?.data["error"]);
      } else {
        throw const ServerException(CustomResponse.serverBusy);
      }
    }
  }
}
