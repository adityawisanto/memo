import 'package:memo/packages/packages.dart';

abstract class AuditSource {
  Future<AuditModel> getCurrentAudit();
}

class AuditSourceImpl implements AuditSource {
  final Dio dio;

  AuditSourceImpl({
    required this.dio,
  });

  @override
  Future<AuditModel> getCurrentAudit() async {
    try {
      if (await CustomInternet().checked()) {
        final response = await dio.get(
          CustomEnv().env("LKM_CHECKLIST"),
        );

        await AuditTable().truncateAudit();

        for (var item in response.data["data"]) {
          await AuditTable().createAudit(
            DataAuditModel(
              id: item["ID"],
              createdAt: item["CreatedAt"],
              updatedAt: item["UpdatedAt"],
              deletedAt: item["DeletedAt"],
              category: item["category"],
              def: item["default"],
              name: item["name"],
              type: item["type"],
              group: item["group"],
            ),
          );
        }
        return await AuditTable().getAudit();
      } else {
        return await AuditTable().getAudit();
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
