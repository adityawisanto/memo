import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class UserRepositoryImpl implements UserRepository {
  final UserSource userSource;

  const UserRepositoryImpl({
    required this.userSource,
  });

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final result = await userSource.getCurrentUser();
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
  Future<Either<Failure, String>> postCurrentUser(
    String image,
  ) async {
    try {
      final result = await userSource.postCurrentUser(
        image,
      );
      return Right(
        result,
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(e.error.toString()));
    } on SocketException {
      return const Left(ConnectionFailure(CustomResponse.noInternet));
    }
  }
}
