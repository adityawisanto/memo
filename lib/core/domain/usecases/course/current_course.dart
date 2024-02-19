import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class GetCurrentCourse {
  final CourseRepository courseRepository;

  GetCurrentCourse(
    this.courseRepository,
  );

  Future<Either<Failure, Course>> getCourse() {
    return courseRepository.getCurrentCourse();
  }

  Future<Either<Failure, DataCourse>> searchCourse(
    String? title,
  ) {
    return courseRepository.searchCurrentCourse(
      title,
    );
  }
}
