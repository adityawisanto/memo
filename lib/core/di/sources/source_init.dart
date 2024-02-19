import 'package:memo/packages/packages.dart';

Future<void> sourceInit() async {
  locator.registerLazySingleton<AnswerSource>(
    () => AnswerSourceImpl(
      dio: locator(),
    ),
  );
  locator.registerLazySingleton<AssignSource>(
    () => AssignSourceImpl(
      dio: locator(),
    ),
  );
  locator.registerLazySingleton<AuditSource>(
    () => AuditSourceImpl(
      dio: locator(),
    ),
  );
  locator.registerLazySingleton<BundleSource>(
    () => BundleSourceImpl(
      dio: locator(),
      lkmBloc: locator(),
    ),
  );
  locator.registerLazySingleton<CheckSource>(
    () => CheckSourceImpl(
      dio: locator(),
    ),
  );
  locator.registerLazySingleton<CourseSource>(
    () => CourseSourceImpl(
      dio: locator(),
    ),
  );
  locator.registerLazySingleton<ExamSource>(
    () => ExamSourceImpl(
      dio: locator(),
    ),
  );
  locator.registerLazySingleton<InventorySource>(
    () => InventorySourceImpl(
      dio: locator(),
      customPreferences: locator(),
    ),
  );
  locator.registerLazySingleton<LkmSource>(
    () => LkmSourceImpl(
      dio: locator(),
    ),
  );
  locator.registerLazySingleton<LocationSource>(
    () => LocationSourceImpl(
      dio: locator(),
    ),
  );
  locator.registerLazySingleton<LoginSource>(
    () => LoginSourceImpl(
      dio: locator(),
      customPreferences: locator(),
    ),
  );
  locator.registerLazySingleton<ReportSource>(
    () => ReportSourceImpl(
      dio: locator(),
    ),
  );
  locator.registerLazySingleton<SallarySource>(
    () => SallarySourceImpl(
      dio: locator(),
      customPreferences: locator(),
    ),
  );
  locator.registerLazySingleton<SeenSource>(
    () => SeenSourceImpl(
      dio: locator(),
    ),
  );
  locator.registerLazySingleton<StatusSource>(
    () => StatusSourceImpl(
      dio: locator(),
    ),
  );
  locator.registerLazySingleton<SummarySource>(
    () => SummarySourceImpl(
      dio: locator(),
    ),
  );
  locator.registerLazySingleton<TicketSource>(
    () => TicketSourceImpl(
      dio: locator(),
      customPreferences: locator(),
    ),
  );
  locator.registerLazySingleton<UserSource>(
    () => UserSourceImpl(
      dio: locator(),
      customPreferences: locator(),
    ),
  );
  locator.registerLazySingleton<WarehouseSource>(
    () => WarehouseSourceImpl(
      dio: locator(),
    ),
  );
}
