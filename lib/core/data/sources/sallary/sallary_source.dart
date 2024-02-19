import 'package:memo/packages/packages.dart';

abstract class SallarySource {
  Future<SallaryModel> getCurrentSallary();
}

class SallarySourceImpl implements SallarySource {
  final Dio dio;
  final CustomPreferences customPreferences;

  SallarySourceImpl({
    required this.dio,
    required this.customPreferences,
  });

  @override
  Future<SallaryModel> getCurrentSallary() async {
    try {
      if (await CustomInternet().checked()) {
        final idUser = await customPreferences.getIdUser();

        final response = await dio.get(
          CustomEnv().env("SALLARY_LOG"),
          queryParameters: {
            "param": "user_id:$idUser,month:9,year:2023",
          },
        );

        final data = response.data["data"][0];

        await SallaryTable().truncateSallary();

        await SallaryTable().createSallary(
          DataSallaryModel(
            total: data["total"],
            updatedAt: data["UpdatedAt"],
          ),
        );

        return await SallaryTable().getSallary();
      } else {
        return await SallaryTable().getSallary();
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
