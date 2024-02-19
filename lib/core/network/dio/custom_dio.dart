import 'package:memo/packages/packages.dart';

class CustomDio {
  CustomDio();

  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(hours: 1),
      receiveTimeout: const Duration(hours: 1),
      baseUrl: CustomEnv().env("BASE_URL"),
    );
    Dio dio = Dio(options);
    dio.interceptors.addAll(<Interceptor>[CustomInterceptor()]);
    return dio;
  }
}
