import 'package:memo/packages/packages.dart';

const String reportTable = 'report';
const String reportItemTable = 'reportitem';

class ReportTable {
  final customSqflite = locator<CustomSqflite>();

  Future<void> createReportTable(Database db) async {
    const id = "INT";
    const createdAt = "TEXT";
    const installType = "INT";
    const totalLkm = "INT";
    const name = "TEXT";
    const sn = "TEXT";
    const qty = "INT";

    await db.execute(
      "CREATE TABLE $reportTable (id $id, created_at $createdAt, install_type $installType, qty $totalLkm)",
    );

    await db.execute(
      "CREATE TABLE $reportItemTable (id $id, name $name, sn $sn, qty $qty)",
    );
  }

  Future<int> createReport(
    DataReportModel dataReportModel,
  ) async {
    final db = await customSqflite.database;

    return await db.insert(
      reportTable,
      dataReportModel.toJson(),
    );
  }

  Future<int> createReportItem(
    ReportItemModel reportItemModel,
  ) async {
    final db = await customSqflite.database;

    return await db.insert(
      reportItemTable,
      reportItemModel.toJson(),
    );
  }

  Future<ReportModel> getReport() async {
    final db = await customSqflite.database;

    final List<Map<String, dynamic>> history = await db.query(
      reportTable,
    );

    final List<Map<String, dynamic>> lkmItem = await db.query(
      reportItemTable,
    );

    return ReportModel(
      data: history
          .map(
            (e) => DataReportModel.fromJson(
              e,
              lkmItem
                  .map(
                    (e) => ReportItemModel.fromJson(
                      e,
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }

  Future<void> truncateReport() async {
    final db = await customSqflite.database;
    await db.delete(reportTable);
    await db.delete(reportItemTable);
  }
}
