import 'package:memo/packages/packages.dart';

abstract class AnswerEvent extends Equatable {
  const AnswerEvent();

  @override
  List<Object?> get props => [];
}

class AnswerSubmitted extends AnswerEvent {
  final int? idCourse;
  final String? answers;

  const AnswerSubmitted({
    required this.idCourse,
    required this.answers,
  });

  @override
  List<Object?> get props => [
        idCourse,
        answers,
      ];
}
