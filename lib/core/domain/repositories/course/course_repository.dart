import 'package:dartz/dartz.dart';

import 'package:memo/packages/packages.dart';

abstract class CourseRepository {
  Future<Either<Failure, Course>> getCurrentCourse();
  Future<Either<Failure, DataCourse>> searchCurrentCourse(
    String? title,
  );
}
