import 'package:dartz/dartz.dart';

import 'package:memo/packages/packages.dart';

abstract class InventoryRepository {
  Future<Either<Failure, Inventory>> getCurrentInventory(
    String? type,
  );
}
