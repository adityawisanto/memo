import 'package:memo/packages/packages.dart';

abstract class SummaryEvent extends Equatable {
  const SummaryEvent();

  @override
  List<Object?> get props => [];
}

class SummaryStatisticGetted extends SummaryEvent {
  final String? startDate;
  final String? endDate;

  const SummaryStatisticGetted({
    required this.startDate,
    required this.endDate,
  });

  @override
  List<Object?> get props => [
        startDate,
        endDate,
      ];
}
