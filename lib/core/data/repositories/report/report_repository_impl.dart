import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class ReportRepositoryImpl implements ReportRepository {
  final ReportSource reportSource;

  const ReportRepositoryImpl({
    required this.reportSource,
  });

  @override
  Future<Either<Failure, Report>> getCurrentReport() async {
    try {
      final result = await reportSource.getCurrentReport();
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
