import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class ExamRepositoryImpl implements ExamRepository {
  final ExamSource examSource;

  const ExamRepositoryImpl({
    required this.examSource,
  });

  @override
  Future<Either<Failure, Exam>> getCurrentExam(
    String? id,
  ) async {
    try {
      final result = await examSource.getCurrentExam(
        id,
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
