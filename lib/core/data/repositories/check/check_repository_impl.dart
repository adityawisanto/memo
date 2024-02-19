import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class CheckRepositoryImpl implements CheckRepository {
  final CheckSource checkSource;

  const CheckRepositoryImpl({
    required this.checkSource,
  });

  @override
  Future<Either<Failure, Checkin>> postCurrentCheckin() async {
    try {
      final result = await checkSource.postCurrentCheckin();
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
  Future<Either<Failure, Checkout>> postCurrentCheckout() async {
    try {
      final result = await checkSource.postCurrentCheckout();
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
