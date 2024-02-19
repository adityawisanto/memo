import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class SeenRepositoryImpl implements SeenRepository {
  final SeenSource seenSource;

  const SeenRepositoryImpl({
    required this.seenSource,
  });

  @override
  Future<Either<Failure, String>> postCurrentSeen() async {
    try {
      final result = await seenSource.postCurrentSeen();
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
