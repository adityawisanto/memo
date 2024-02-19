import 'package:dartz/dartz.dart';

import 'package:memo/packages/packages.dart';

abstract class ReportRepository {
  Future<Either<Failure, Report>> getCurrentReport();
}
