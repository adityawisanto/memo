import 'package:memo/packages/packages.dart';

class WarehouseModel extends Equatable {
  final List<DataWarehouseModel>? data;

  const WarehouseModel({
    required this.data,
  });

  factory WarehouseModel.fromJson(
    Map<String, dynamic> json,
    List<WarehouseSnModel>? dataSn,
  ) {
    return WarehouseModel(
      data: List<DataWarehouseModel>.from(
        json["data"].map(
          (x) => DataWarehouseModel.fromJson(
            x,
            dataSn,
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data,
      };

  Warehouse toEntity() => Warehouse(
        data: data!
            .map(
              (e) => DataWarehouse(
                idStock: e.idStock,
                type: e.type,
                category: e.category,
                total: e.total,
                def: e.def,
                dataSn: e.dataSn!
                    .map(
                      (e) => WarehouseSn(
                        idSn: e.idSn,
                        type: e.type,
                        sn: e.sn,
                      ),
                    )
                    .toList(),
              ),
            )
            .toList(),
      );

  @override
  List<Object?> get props => [
        data,
      ];
}
