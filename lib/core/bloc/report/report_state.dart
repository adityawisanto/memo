import 'package:memo/packages/packages.dart';

abstract class ReportState extends Equatable {
  const ReportState();

  @override
  List<Object?> get props => [];
}

class ReportInitialized extends ReportState {}

class ReportLoading extends ReportState {}

class ReportGetSuccess extends ReportState {
  final Report report;

  const ReportGetSuccess(this.report);

  @override
  List<Object?> get props => [report];
}

class ReportFailure extends ReportState {
  final String message;

  const ReportFailure(this.message);

  @override
  List<Object?> get props => [message];
}
