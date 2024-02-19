import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseSource courseSource;

  const CourseRepositoryImpl({
    required this.courseSource,
  });

  @override
  Future<Either<Failure, Course>> getCurrentCourse() async {
    try {
      final result = await courseSource.getCurrentCourse();
      return Right(
        result.toEntity(),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(e.error.toString()));
    } on SocketException {
      return const Left(ConnectionFailure(CustomResponse.noInternet));
    }
  }

  @override
  Future<Either<Failure, DataCourse>> searchCurrentCourse(
    String? title,
  ) async {
    try {
      final result = await courseSource.searchCurrentCourse(
        title,
      );
      return Right(
        result.toEntity(),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(e.error.toString()));
    } on SocketException {
      return const Left(ConnectionFailure(CustomResponse.noInternet));
    }
  }
}
