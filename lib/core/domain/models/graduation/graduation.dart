import 'package:memo/packages/packages.dart';

class GraduationArgument extends Equatable {
  final DataAnswer? dataAnswer;
  final int total;

  const GraduationArgument({
    required this.dataAnswer,
    required this.total,
  });

  @override
  List<Object?> get props => [
        dataAnswer,
        total,
      ];
}
