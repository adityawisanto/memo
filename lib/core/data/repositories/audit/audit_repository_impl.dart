import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class AuditRepositoryImpl implements AuditRepository {
  final AuditSource auditSource;

  const AuditRepositoryImpl({
    required this.auditSource,
  });

  @override
  Future<Either<Failure, Audit>> getCurrentAudit() async {
    try {
      final result = await auditSource.getCurrentAudit();
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
