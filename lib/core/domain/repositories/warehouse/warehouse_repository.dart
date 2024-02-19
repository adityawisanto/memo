import 'package:dartz/dartz.dart';

import 'package:memo/packages/packages.dart';

abstract class WarehouseRepository {
  Future<Either<Failure, Warehouse>> getCurrentWarehouse();
}
