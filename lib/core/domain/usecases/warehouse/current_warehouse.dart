import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class GetCurrentWarehouse {
  final WarehouseRepository warehouseRepository;

  GetCurrentWarehouse(
    this.warehouseRepository,
  );

  Future<Either<Failure, Warehouse>> get() {
    return warehouseRepository.getCurrentWarehouse();
  }
}
