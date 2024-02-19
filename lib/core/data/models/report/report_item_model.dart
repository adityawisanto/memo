import 'package:memo/packages/packages.dart';

class ReportItemModel extends Equatable {
  final int? id;
  final String? name;
  final String? sn;
  final int? qty;

  const ReportItemModel({
    required this.id,
    required this.name,
    required this.sn,
    required this.qty,
  });

  factory ReportItemModel.fromJson(Map<String, dynamic> json) {
    return ReportItemModel(
      id: json["id"],
      name: json["name"],
      sn: json["sn"],
      qty: json["qty"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sn": sn,
        "qty": qty,
      };

  ReportItem toEntity() => ReportItem(
        id: id,
        name: name,
        sn: sn,
        qty: qty,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        sn,
        qty,
      ];
}
