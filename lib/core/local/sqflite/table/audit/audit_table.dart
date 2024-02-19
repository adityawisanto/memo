import 'package:memo/packages/packages.dart';

const String auditTable = 'audit';

class AuditTable {
  final customSqflite = locator<CustomSqflite>();

  Future<void> createAuditTable(Database db) async {
    const id = "INT";
    const createdAt = "TEXT";
    const updatedAt = "TEXT";
    const deletedAt = "TEXT";
    const category = "TEXT";
    const def = "TEXT";
    const name = "TEXT";
    const type = "TEXT";
    const tab = "TEXT";

    await db.execute(
      "CREATE TABLE $auditTable (ID $id, CreatedAt $createdAt, UpdatedAt $updatedAt, DeletedAt $deletedAt, category $category, def $def, name $name, type $type, tab $tab)",
    );
  }

  Future<int> createAudit(
    DataAuditModel dataAuditModel,
  ) async {
    final db = await customSqflite.database;
    return await db.insert(
      auditTable,
      dataAuditModel.toJson(),
    );
  }

  Future<AuditModel> getAudit() async {
    final db = await customSqflite.database;
    final result = await db.query(
      auditTable,
    );

    return AuditModel(
      data: result
          .map(
            (e) => DataAuditModel.fromJson(e),
          )
          .toList(),
    );
  }

  Future<int> truncateAudit() async {
    final db = await customSqflite.database;
    return await db.delete(auditTable);
  }
}
