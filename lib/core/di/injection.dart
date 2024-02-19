import 'package:memo/packages/packages.dart';

final locator = GetIt.instance;

void init() {
  blocInit();

  // usecase
  usecasesInit();

  // repository
  repositoryInit();

  // data source
  sourceInit();

  // internal
  initInternal();
}
