import 'package:memo/packages/packages.dart';

export 'data_answer.dart';

class Answer extends Equatable {
  final DataAnswer? data;

  const Answer({
    required this.data,
  });

  @override
  List<Object?> get props => [
        data,
      ];
}
