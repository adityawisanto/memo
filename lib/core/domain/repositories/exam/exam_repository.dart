import 'package:dartz/dartz.dart';

import 'package:memo/packages/packages.dart';

abstract class ExamRepository {
  Future<Either<Failure, Exam>> getCurrentExam(
    String? id,
  );
}
