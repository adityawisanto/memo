import 'package:memo/packages/packages.dart';

const String sallaryTable = "sallary";

class SallaryTable {
  final customSqflite = locator<CustomSqflite>();

  Future<void> createSallaryTable(Database db) async {
    const id = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const total = "INT";
    const updatedAt = "TEXT";

    await db.execute(
      "CREATE TABLE $sallaryTable (id $id, total $total, updated_at $updatedAt)",
    );
  }

  Future<int> createSallary(
    DataSallaryModel dataSallaryModel,
  ) async {
    final db = await customSqflite.database;

    await db.delete(sallaryTable);

    return await db.insert(
      sallaryTable,
      dataSallaryModel.toJson(),
    );
  }

  Future<SallaryModel> getSallary() async {
    final db = await customSqflite.database;
    final result = await db.query(
      sallaryTable,
    );

    return SallaryModel(
      data: result
          .map(
            (e) => DataSallaryModel.fromJson(
              e,
            ),
          )
          .first,
    );
  }

  Future<int> truncateSallary() async {
    final db = await customSqflite.database;
    return await db.delete(sallaryTable);
  }
}
