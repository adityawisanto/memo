import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class SummaryRepositoryImpl implements SummaryRepository {
  final SummarySource summarySource;

  const SummaryRepositoryImpl({
    required this.summarySource,
  });

  @override
  Future<Either<Failure, SummaryStatistic>> getCurrentStatistic(
    String? startDate,
    String? endDate,
  ) async {
    try {
      final result = await summarySource.getCurrentStatistic(
        startDate,
        endDate,
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
