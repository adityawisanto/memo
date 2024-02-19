import 'package:memo/packages/packages.dart';

class DataAnswer extends Equatable {
  final int? score;
  final int? correct;

  const DataAnswer({
    required this.score,
    required this.correct,
  });

  @override
  List<Object?> get props => [
        score,
        correct,
      ];
}
