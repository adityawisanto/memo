import 'package:memo/packages/packages.dart';

abstract class SeenSource {
  Future<String> postCurrentSeen();
}

class SeenSourceImpl implements SeenSource {
  final Dio dio;

  SeenSourceImpl({
    required this.dio,
  });

  @override
  Future<String> postCurrentSeen() async {
    try {
      final response = await dio.post(
        CustomEnv().env("ADD_SEEN"),
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
