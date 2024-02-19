import 'package:memo/packages/packages.dart';

class DataInventoryModel extends Equatable {
  final String? sn;
  final String? status;
  final int? qty;
  final String? date;

  const DataInventoryModel({
    required this.sn,
    required this.status,
    required this.qty,
    required this.date,
  });

  factory DataInventoryModel.fromJson(Map<String, dynamic> json) {
    return DataInventoryModel(
      sn: json["sn"],
      qty: json["qty"],
      status: json["status"],
      date: json["CreatedAt"],
    );
  }

  Map<String, dynamic> toJson() => {
        "sn": sn,
        "qty": qty,
        "status": status,
        "CreatedAt": date,
      };

  DataInventory toEntity() => DataInventory(
        sn: sn,
        qty: qty,
        status: status,
        date: date,
      );

  @override
  List<Object?> get props => [
        sn,
        qty,
        status,
        date,
      ];
}
