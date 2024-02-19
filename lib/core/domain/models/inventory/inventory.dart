import 'package:memo/packages/packages.dart';

export 'data_inventory.dart';

class Inventory extends Equatable {
  final List<DataInventory>? data;

  const Inventory({
    required this.data,
  });

  @override
  List<Object?> get props => [
        data,
      ];
}

class InventoryArgument extends Equatable {
  final DataWarehouse dataWarehouse;

  const InventoryArgument({
    required this.dataWarehouse,
  });

  @override
  List<Object?> get props => [
        dataWarehouse,
      ];
}
