import 'package:memo/packages/packages.dart';

const String inventoryTable = 'inventory';

class InventoryTable {
  final customSqflite = locator<CustomSqflite>();

  Future<void> createInventoryTable(Database db) async {
    const id = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const sn = "TEXT";
    const qty = "INT";
    const status = "TEXT";
    const date = "TEXT";

    await db.execute(
      'CREATE TABLE $inventoryTable (id $id, sn $sn, qty $qty, status $status, CreatedAt $date)',
    );
  }

  Future<int> createInventory(
    DataInventoryModel dataInventoryModel,
  ) async {
    final db = await customSqflite.database;
    return await db.insert(
      inventoryTable,
      dataInventoryModel.toJson(),
    );
  }

  Future<InventoryModel> getInventory() async {
    final db = await customSqflite.database;
    final result = await db.query(
      inventoryTable,
    );

    return InventoryModel(
      data: result
          .map(
            (e) => DataInventoryModel.fromJson(
              e,
            ),
          )
          .toList(),
    );
  }

  Future<int> truncateInventory() async {
    final db = await customSqflite.database;
    return await db.delete(inventoryTable);
  }
}
