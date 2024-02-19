import 'package:memo/packages/packages.dart';

Future<void> usecasesInit() async {
  locator.registerLazySingleton(
    () => GetCurrentAnswer(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetCurrentAssign(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetCurrentAudit(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetCurrentBundle(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetCurrentCheck(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetCurrentCourse(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetCurrentExam(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetCurrentInventory(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetCurrentLkm(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetCurrentLocation(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetCurrentLogin(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetCurrentReport(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetCurrentSallary(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetCurrentSeen(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetCurrentStatus(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetCurrentSummary(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetCurrentTicket(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetCurrentUser(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetCurrentWarehouse(
      locator(),
    ),
  );
}
