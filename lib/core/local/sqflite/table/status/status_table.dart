import 'package:memo/packages/packages.dart';

const String statusTable = 'status';

class StatusTable {
  final customSqflite = locator<CustomSqflite>();

  Future<void> createStatusTable(Database db) async {
    const id = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const idStatus = "INT";
    const titleStatus = "TEXT";
    const idDetailStatus = "INT";
    const detailStatus = "TEXT";

    await db.execute(
      'CREATE TABLE $statusTable (id $id, id_status $idStatus, title_status $titleStatus, id_detail_status $idDetailStatus, detail_status $detailStatus)',
    );
  }

  Future<int> createStatus(
    DataStatusModel dataStatusModel,
  ) async {
    final db = await customSqflite.database;
    return await db.insert(
      statusTable,
      dataStatusModel.toJson(),
    );
  }

  Future<StatusModel> getStatus() async {
    final db = await customSqflite.database;
    final result = await db.query(
      statusTable,
    );

    return StatusModel(
      data: result
          .map(
            (e) => DataStatusModel.fromJson(e),
          )
          .toList(),
    );
  }

  Future<int> truncateStatus() async {
    final db = await customSqflite.database;
    return await db.delete(statusTable);
  }
}
