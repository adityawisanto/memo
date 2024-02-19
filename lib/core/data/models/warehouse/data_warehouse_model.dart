import 'package:memo/packages/packages.dart';

class DataWarehouseModel extends Equatable {
  final int? idStock;
  final String? type;
  final String? category;
  final int? total;
  final int? def;
  final List<WarehouseSnModel>? dataSn;

  const DataWarehouseModel({
    required this.idStock,
    required this.type,
    required this.category,
    required this.total,
    required this.def,
    required this.dataSn,
  });

  factory DataWarehouseModel.fromJson(
    Map<String, dynamic> json,
    List<WarehouseSnModel>? dataSn,
  ) {
    return DataWarehouseModel(
      idStock: json["id_stock"],
      type: json["type"],
      category: json["category"],
      total: json["total"],
      def: json["def"],
      dataSn: dataSn,
    );
  }

  Map<String, dynamic> toJson() => {
        "id_stock": idStock,
        "type": type,
        "category": category,
        "total": total,
        "def": def,
      };

  DataWarehouse toEntity() => DataWarehouse(
        idStock: idStock,
        type: type,
        category: category,
        total: total,
        def: def,
        dataSn: dataSn!
            .map(
              (e) => WarehouseSn(
                idSn: e.idSn,
                type: e.type,
                sn: e.sn,
              ),
            )
            .toList(),
      );

  @override
  List<Object?> get props => [
        idStock,
        type,
        total,
        def,
        dataSn,
      ];
}
