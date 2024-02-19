import 'package:memo/packages/packages.dart';

abstract class UserSource {
  Future<UserModel> getCurrentUser();
  Future<String> postCurrentUser(
    String image,
  );
}

class UserSourceImpl implements UserSource {
  final Dio dio;
  final CustomPreferences customPreferences;

  UserSourceImpl({
    required this.dio,
    required this.customPreferences,
  });

  @override
  Future<UserModel> getCurrentUser() async {
    try {
      if (await CustomInternet().checked()) {
        final response = await dio.get(
          CustomEnv().env("AUTH_USER"),
        );

        await UserTable().truncateUser();

        final userModel = DataUserModel(
          id: response.data["data"]["ID"],
          name: response.data["data"]["name"],
          phone: response.data["data"]["phone"],
          gender: response.data["data"]["gender"],
          createdAt: response.data["bm"]["CreatedAt"],
          nameBm: response.data["bm"]["name"],
          phoneBm: response.data["bm"]["phone"],
          servicePoint: response.data["data"]["Sp"]["name"],
          avatar: response.data["data"]["avatar"] ?? "",
        );

        await customPreferences.savePhone(
          response.data["data"]["phone"],
        );

        await customPreferences.saveUsername(
          response.data["data"]["name"],
        );

        await customPreferences.saveIdUser(
          response.data["data"]["ID"].toString(),
        );

        await customPreferences.saveAvatar(
          response.data["data"]["avatar"],
        );

        await UserTable().createUser(userModel);

        return await UserTable().getUser();
      } else {
        return await UserTable().getUser();
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
  Future<String> postCurrentUser(
    String image,
  ) async {
    String idUser = await customPreferences.getIdUser();

    try {
      final response = await dio.patch(
        CustomEnv().env("MASTER_USER"),
        data: {
          "ID": int.parse(idUser),
          "uploaded_image": image,
        },
      );

      return response.data["message"].toString();
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        throw ServerException(e.response?.data["error"]);
      } else {
        throw const ServerException(CustomResponse.serverBusy);
      }
    }
  }
}
