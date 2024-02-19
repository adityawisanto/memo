import 'package:memo/packages/packages.dart';

import 'package:path/path.dart';

class CustomSqflite {
  static final CustomSqflite instance = CustomSqflite._init();

  static Database? _database;

  CustomSqflite._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('memo.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: createDatabase);
  }

  Future createDatabase(Database db, int version) async {
    TicketTable().createTicketTable(
      db,
    );
    StatusTable().createStatusTable(
      db,
    );
    AuditTable().createAuditTable(
      db,
    );
    WarehouseTable().createWarehouseTable(
      db,
    );
    InventoryTable().createInventoryTable(
      db,
    );
    ReportTable().createReportTable(
      db,
    );
    StatisticTable().createStatisticTable(
      db,
    );
    UserTable().createUserTable(
      db,
    );
    LkmTable().createLkmTable(
      db,
    );
    CourseTable().createCourseTable(
      db,
    );
    ExamTable().createExamTable(
      db,
    );
    SallaryTable().createSallaryTable(
      db,
    );
  }
}
