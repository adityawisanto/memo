import 'package:memo/packages/packages.dart';

abstract class LoginSource {
  Future<LoginModel> postCurrentLogin(
    String? username,
    String? password,
  );
}

class LoginSourceImpl implements LoginSource {
  final Dio dio;
  final CustomPreferences customPreferences;

  LoginSourceImpl({
    required this.dio,
    required this.customPreferences,
  });

  @override
  Future<LoginModel> postCurrentLogin(
    String? username,
    String? password,
  ) async {
    try {
      final response = await dio.post(
        CustomEnv().env("AUTH"),
        data: {
          "username": username,
          "password": password,
          "version": await CustomApplication().getVersion(),
          "manufacturer": Platform.isAndroid
              ? await CustomDevice().getManufactureAndroid()
              : await CustomDevice().getManufactureIos(),
          "model": Platform.isAndroid
              ? await CustomDevice().getModelAndroid()
              : await CustomDevice().getModelIos(),
          "os": Platform.operatingSystem,
          "sdk": Platform.operatingSystemVersion,
        },
      );
      await customPreferences.saveToken(
        response.data["token"],
      );
      return LoginModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        throw ServerException(e.response?.data["error"]);
      } else {
        throw const ServerException(CustomResponse.serverBusy);
      }
    }
  }
}
