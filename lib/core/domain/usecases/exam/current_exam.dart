import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class GetCurrentExam {
  final ExamRepository examRepository;

  GetCurrentExam(
    this.examRepository,
  );

  Future<Either<Failure, Exam>> getExam(
    String? id,
  ) {
    return examRepository.getCurrentExam(
      id,
    );
  }
}
