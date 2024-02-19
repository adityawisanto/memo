import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class GetCurrentAnswer {
  final AnswerRepository answerRepository;

  GetCurrentAnswer(
    this.answerRepository,
  );

  Future<Either<Failure, Answer>> post(
    int? idCourse,
    String? answers,
  ) {
    return answerRepository.postCurrentAnswer(
      idCourse,
      answers,
    );
  }
}
