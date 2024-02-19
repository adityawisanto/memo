import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class AnswerRepositoryImpl implements AnswerRepository {
  final AnswerSource answerSource;

  const AnswerRepositoryImpl({
    required this.answerSource,
  });

  @override
  Future<Either<Failure, Answer>> postCurrentAnswer(
    int? idCourse,
    String? answers,
  ) async {
    try {
      final result = await answerSource.postCurrentAnswer(
        idCourse,
        answers,
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
