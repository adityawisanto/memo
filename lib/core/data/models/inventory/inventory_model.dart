import 'package:memo/packages/packages.dart';

class InventoryModel extends Equatable {
  final List<DataInventoryModel>? data;

  const InventoryModel({
    required this.data,
  });

  factory InventoryModel.fromJson(Map<String, dynamic> json) {
    return InventoryModel(
      data: List<DataInventoryModel>.from(
        json["data"].map(
          (x) => DataInventoryModel.fromJson(x),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data,
      };

  Inventory toEntity() => Inventory(
        data: data!
            .map(
              (e) => DataInventory(
                sn: e.sn,
                qty: e.qty,
                status: e.status,
                date: e.date,
              ),
            )
            .toList(),
      );

  @override
  List<Object?> get props => [
        data,
      ];
}
