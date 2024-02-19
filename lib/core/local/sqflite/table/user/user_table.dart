import 'package:memo/packages/packages.dart';

const String userTable = "user";

class UserTable {
  final customSqflite = locator<CustomSqflite>();

  Future<void> createUserTable(Database db) async {
    const id = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const idUser = "INT";
    const nameUser = "TEXT";
    const phoneUser = "TEXT";
    const genderUser = "TEXT";
    const sinceUser = "TEXT";
    const nameBm = "TEXT";
    const phoneBm = "TEXT";
    const spBm = "TEXT";
    const avatar = "TEXT";

    await db.execute(
      "CREATE TABLE $userTable (id $id, id_user $idUser, name_user $nameUser, phone_user $phoneUser, gender_user $genderUser, since_user $sinceUser, name_bm $nameBm, phone_bm $phoneBm, sp_bm $spBm, avatar $avatar)",
    );
  }

  Future<int> createUser(
    DataUserModel dataUserModel,
  ) async {
    final db = await customSqflite.database;

    return await db.insert(
      userTable,
      dataUserModel.toJson(),
    );
  }

  Future<UserModel> getUser() async {
    final db = await customSqflite.database;
    final result = await db.query(
      userTable,
    );

    return UserModel(
      data: DataUserModel.fromJson(
        result[0],
      ),
    );
  }

  Future<void> truncateUser() async {
    final db = await customSqflite.database;
    await db.delete(userTable);
  }
}
