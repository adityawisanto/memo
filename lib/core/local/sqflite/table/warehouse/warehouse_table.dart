import 'package:memo/packages/packages.dart';

const String warehouseTable = 'warehouse';
const String warehouseSnTable = 'warehousesn';

class WarehouseTable {
  final customSqflite = locator<CustomSqflite>();

  Future<void> createWarehouseTable(Database db) async {
    const id = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const idSn = 'INT';
    const idStock = "INT";
    const type = "TEXT";
    const category = "TEXT";
    const total = "INT";
    const def = "INT";
    const sn = "TEXT";

    await db.execute(
      'CREATE TABLE $warehouseTable (id $id, id_stock $idStock, type $type, category $category, def $def, total $total)',
    );

    await db.execute(
      'CREATE TABLE $warehouseSnTable (id $id, id_sn $idSn, type $type, sn $sn)',
    );
  }

  Future<int> createWarehouse(
    DataWarehouseModel dataWarehouseModel,
  ) async {
    final db = await customSqflite.database;

    if (dataWarehouseModel.dataSn != [] || dataWarehouseModel.dataSn != null) {
      for (var sns in dataWarehouseModel.dataSn!) {
        createWarehouseSn(
          WarehouseSnModel(
            idSn: sns.idSn,
            type: sns.type,
            sn: sns.sn,
          ),
        );
      }
    }

    return await db.insert(
      warehouseTable,
      dataWarehouseModel.toJson(),
    );
  }

  Future<int> createWarehouseSn(
    WarehouseSnModel warehouseSnModel,
  ) async {
    final db = await customSqflite.database;
    return await db.insert(
      warehouseSnTable,
      warehouseSnModel.toJson(),
    );
  }

  Future<WarehouseModel> getWarehouse() async {
    final db = await customSqflite.database;
    final result = await db.query(
      warehouseTable,
    );

    final sn = await db.query(
      warehouseSnTable,
    );

    return WarehouseModel(
      data: result
          .map(
            (e) => DataWarehouseModel.fromJson(
              e,
              sn
                  .map(
                    (e) => WarehouseSnModel.fromJson(
                      e,
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }

  Future<void> truncateWarehouse() async {
    final db = await customSqflite.database;
    await db.delete(warehouseTable);
    await db.delete(warehouseSnTable);
  }
}
