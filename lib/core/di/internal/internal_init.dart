import 'package:memo/packages/packages.dart';

Future<void> initInternal() async {
  locator.registerLazySingleton<CustomPreferences>(
    () => CustomPreferences(),
  );

  locator.registerLazySingleton(
    () => CustomDio().dio,
  );

  locator.registerLazySingleton(
    () => CustomSqflite.instance,
  );
}
