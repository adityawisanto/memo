import 'package:memo/packages/packages.dart';

abstract class CheckSource {
  Future<CheckinModel> postCurrentCheckin();
  Future<CheckoutModel> postCurrentCheckout();
}

class CheckSourceImpl implements CheckSource {
  final Dio dio;

  CheckSourceImpl({
    required this.dio,
  });

  @override
  Future<CheckinModel> postCurrentCheckin() async {
    try {
      final response = await dio.post(
        CustomEnv().env(
          "CHECKIN",
        ),
      );
      return CheckinModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        throw ServerException(e.response?.data["error"]);
      } else {
        throw const ServerException(CustomResponse.serverBusy);
      }
    }
  }

  @override
  Future<CheckoutModel> postCurrentCheckout() async {
    try {
      final response = await dio.post(
        CustomEnv().env(
          "CHECKOUT",
        ),
      );
      return CheckoutModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        throw ServerException(e.response?.data["error"]);
      } else {
        throw const ServerException(CustomResponse.serverBusy);
      }
    }
  }
}
