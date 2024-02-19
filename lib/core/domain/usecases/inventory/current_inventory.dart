import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class GetCurrentInventory {
  final InventoryRepository inventoryRepository;

  GetCurrentInventory(
    this.inventoryRepository,
  );

  Future<Either<Failure, Inventory>> getInventory(
    String? type,
  ) {
    return inventoryRepository.getCurrentInventory(
      type,
    );
  }
}
