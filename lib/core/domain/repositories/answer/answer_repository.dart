import 'package:dartz/dartz.dart';

import 'package:memo/packages/packages.dart';

abstract class AnswerRepository {
  Future<Either<Failure, Answer>> postCurrentAnswer(
    int? idCourse,
    String? answers,
  );
}
