import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class WarehouseRepositoryImpl implements WarehouseRepository {
  final WarehouseSource warehouseSource;

  const WarehouseRepositoryImpl({
    required this.warehouseSource,
  });

  @override
  Future<Either<Failure, Warehouse>> getCurrentWarehouse() async {
    try {
      final result = await warehouseSource.getCurrentWarehouse();
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
