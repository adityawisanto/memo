import 'package:memo/packages/packages.dart';

abstract class SummaryState extends Equatable {
  const SummaryState();

  @override
  List<Object?> get props => [];
}

class SummaryInitialized extends SummaryState {}

class SummaryLoading extends SummaryState {}

class SummaryStatisticGetSuccess extends SummaryState {
  final SummaryStatistic summaryStatistic;

  const SummaryStatisticGetSuccess(this.summaryStatistic);

  @override
  List<Object?> get props => [summaryStatistic];
}

class SummaryFailure extends SummaryState {
  final String message;

  const SummaryFailure(this.message);

  @override
  List<Object?> get props => [message];
}
