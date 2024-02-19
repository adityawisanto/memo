import 'package:memo/packages/packages.dart';

abstract class LocationSource {
  Future<String> postCurrentLocation();
}

class LocationSourceImpl implements LocationSource {
  final Dio dio;

  LocationSourceImpl({
    required this.dio,
  });

  @override
  Future<String> postCurrentLocation() async {
    try {
      final response = await dio.post(
        CustomEnv().env("HEART_BEAT"),
        data: {
          "longitude": await CustomGeolocation().longitude(),
          "latitude": await CustomGeolocation().latitude(),
        },
      );

      return response.data["message"];
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        throw ServerException(e.response?.data["error"]);
      } else {
        throw const ServerException(CustomResponse.serverBusy);
      }
    }
  }
}
