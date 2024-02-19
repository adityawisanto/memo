import 'package:memo/packages/packages.dart';

const String summaryStatisticTable = 'summarystatistic';

class StatisticTable {
  final customSqflite = locator<CustomSqflite>();

  Future<void> createStatisticTable(Database db) async {
    const id = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const installType = "INT";
    const idStatusTicket = "INT";
    const total = "INT";
    const inSla = "INT";
    const outSla = "INT";

    await db.execute(
      'CREATE TABLE $summaryStatisticTable (id $id, install_type $installType, id_status_ticket $idStatusTicket, total $total, in_sla $inSla, out_sla $outSla)',
    );
  }

  Future<int> createStatistic(
    SummaryDataStatisticModel summaryDataStatisticModel,
  ) async {
    final db = await customSqflite.database;
    return await db.insert(
      summaryStatisticTable,
      summaryDataStatisticModel.toJson(),
    );
  }

  Future<SummaryStatisticModel> getStatistic() async {
    final db = await customSqflite.database;
    final result = await db.query(
      summaryStatisticTable,
    );

    return SummaryStatisticModel(
      data: result
          .map(
            (e) => SummaryDataStatisticModel.fromJson(e),
          )
          .toList(),
    );
  }

  Future<int> truncateStatistic() async {
    final db = await customSqflite.database;
    return await db.delete(summaryStatisticTable);
  }
}
