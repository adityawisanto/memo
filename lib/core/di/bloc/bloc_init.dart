import 'package:memo/packages/packages.dart';

Future<void> blocInit() async {
  locator.registerFactory(
    () => AnswerBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => AssignBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => AuditBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => BundleBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => CheckBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => CourseBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => ExamBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => InventoryBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => LkmBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => LocationBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => LoginBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => ReportBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => SallaryBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => SeenBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => StatusBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => SummaryBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TicketBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => UserBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => WarehouseBloc(
      locator(),
    ),
  );
}
