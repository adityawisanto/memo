import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class StatusRepositoryImpl implements StatusRepository {
  final StatusSource statusSource;

  const StatusRepositoryImpl({
    required this.statusSource,
  });

  @override
  Future<Either<Failure, Status>> getCurrentStatus(
    String? type,
  ) async {
    try {
      final result = await statusSource.getCurrentStatus(
        type,
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

  @override
  Future<Either<Failure, String>> postCurrentStatus(
    int? idTicket,
    int? idStatus,
    int? idStatusDetail,
    String? statusTicket,
    String? notes,
  ) async {
    try {
      final result = await statusSource.postCurrentStatus(
        idTicket,
        idStatus,
        idStatusDetail,
        statusTicket,
        notes,
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
