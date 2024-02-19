import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class InventoryRepositoryImpl implements InventoryRepository {
  final InventorySource inventorySource;

  const InventoryRepositoryImpl({
    required this.inventorySource,
  });

  @override
  Future<Either<Failure, Inventory>> getCurrentInventory(
    String? url,
  ) async {
    try {
      final result = await inventorySource.getCurrentInventory(
        url,
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
