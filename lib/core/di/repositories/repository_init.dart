import 'package:memo/packages/packages.dart';

Future<void> repositoryInit() async {
  locator.registerLazySingleton<AnswerRepository>(
    () => AnswerRepositoryImpl(
      answerSource: locator(),
    ),
  );
  locator.registerLazySingleton<AssignRepository>(
    () => AssignRepositoryImpl(
      assignSource: locator(),
    ),
  );
  locator.registerLazySingleton<AuditRepository>(
    () => AuditRepositoryImpl(
      auditSource: locator(),
    ),
  );
  locator.registerLazySingleton<BundleRepository>(
    () => BundleRepositoryImpl(
      bundleSource: locator(),
    ),
  );
  locator.registerLazySingleton<CheckRepository>(
    () => CheckRepositoryImpl(
      checkSource: locator(),
    ),
  );
  locator.registerLazySingleton<CourseRepository>(
    () => CourseRepositoryImpl(
      courseSource: locator(),
    ),
  );
  locator.registerLazySingleton<ExamRepository>(
    () => ExamRepositoryImpl(
      examSource: locator(),
    ),
  );
  locator.registerLazySingleton<InventoryRepository>(
    () => InventoryRepositoryImpl(
      inventorySource: locator(),
    ),
  );
  locator.registerLazySingleton<LkmRepository>(
    () => LkmRepositoryImpl(
      lkmSource: locator(),
    ),
  );
  locator.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(
      locationSource: locator(),
    ),
  );
  locator.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      loginSource: locator(),
    ),
  );
  locator.registerLazySingleton<ReportRepository>(
    () => ReportRepositoryImpl(
      reportSource: locator(),
    ),
  );
  locator.registerLazySingleton<SallaryRepository>(
    () => SallaryRepositoryImpl(
      sallarySource: locator(),
    ),
  );
  locator.registerLazySingleton<SeenRepository>(
    () => SeenRepositoryImpl(
      seenSource: locator(),
    ),
  );
  locator.registerLazySingleton<StatusRepository>(
    () => StatusRepositoryImpl(
      statusSource: locator(),
    ),
  );
  locator.registerLazySingleton<SummaryRepository>(
    () => SummaryRepositoryImpl(
      summarySource: locator(),
    ),
  );
  locator.registerLazySingleton<TicketRepository>(
    () => TicketRepositoryImpl(
      ticketSource: locator(),
    ),
  );
  locator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      userSource: locator(),
    ),
  );
  locator.registerLazySingleton<WarehouseRepository>(
    () => WarehouseRepositoryImpl(
      warehouseSource: locator(),
    ),
  );
}
