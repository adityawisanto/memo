import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class AssignRepositoryImpl implements AssignRepository {
  final AssignSource assignSource;

  const AssignRepositoryImpl({
    required this.assignSource,
  });

  @override
  Future<Either<Failure, String>> postCurrentAssign(
    int? idAssign,
    String? status,
  ) async {
    try {
      final result = await assignSource.postCurrentAssign(
        idAssign,
        status,
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
