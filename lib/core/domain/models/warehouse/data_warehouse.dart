import 'package:memo/packages/packages.dart';

class DataWarehouse {
  final int? idStock;
  final String? type;
  final String? category;
  int? total;
  int? def;
  final List<WarehouseSn>? dataSn;

  DataWarehouse({
    required this.idStock,
    required this.type,
    required this.category,
    required this.total,
    required this.def,
    required this.dataSn,
  });
}
