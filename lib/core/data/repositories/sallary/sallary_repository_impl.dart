import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class SallaryRepositoryImpl implements SallaryRepository {
  final SallarySource sallarySource;

  const SallaryRepositoryImpl({
    required this.sallarySource,
  });

  @override
  Future<Either<Failure, Sallary>> getCurrentSallary() async {
    try {
      final result = await sallarySource.getCurrentSallary();
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
