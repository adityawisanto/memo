import 'package:dartz/dartz.dart';

import 'package:memo/packages/packages.dart';

abstract class SummaryRepository {
  Future<Either<Failure, SummaryStatistic>> getCurrentStatistic(
    String? startDate,
    String? endDate,
  );
}
