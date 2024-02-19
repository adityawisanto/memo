import 'package:memo/packages/packages.dart';

class SummaryStatistic extends Equatable {
  final List<SummaryDataStatistic>? data;

  const SummaryStatistic({
    required this.data,
  });

  @override
  List<Object?> get props => [
        data,
      ];
}
