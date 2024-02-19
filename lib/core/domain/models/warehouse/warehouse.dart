import 'package:memo/packages/packages.dart';

export 'data_warehouse.dart';
export 'warehouse_sn.dart';

class Warehouse extends Equatable {
  final List<DataWarehouse>? data;

  const Warehouse({
    required this.data,
  });

  @override
  List<Object?> get props => [
        data,
      ];
}
