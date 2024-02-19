import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class GetCurrentSummary {
  final SummaryRepository summaryRepository;

  GetCurrentSummary(
    this.summaryRepository,
  );

  Future<Either<Failure, SummaryStatistic>> get(
    String? startDate,
    String? endDate,
  ) {
    return summaryRepository.getCurrentStatistic(
      startDate,
      endDate,
    );
  }
}
