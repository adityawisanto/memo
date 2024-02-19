import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class GetCurrentReport {
  final ReportRepository reportRepository;

  GetCurrentReport(
    this.reportRepository,
  );

  Future<Either<Failure, Report>> get() {
    return reportRepository.getCurrentReport();
  }
}
