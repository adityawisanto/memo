import 'package:memo/packages/packages.dart';

class DataReportModel extends Equatable {
  final int? id;
  final String? createdAt;
  final int? installType;
  final int? qty;
  final List<ReportItemModel>? reportItem;

  const DataReportModel({
    required this.id,
    required this.createdAt,
    required this.installType,
    required this.qty,
    required this.reportItem,
  });

  factory DataReportModel.fromJson(
    Map<String, dynamic> json,
    List<ReportItemModel>? reportItem,
  ) {
    return DataReportModel(
      id: json["id"],
      createdAt: json["created_at"],
      installType: json["install_type"],
      qty: json["qty"],
      reportItem: reportItem,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt,
        "install_type": installType,
        "qty": qty,
      };

  DataReport toEntity() => DataReport(
        id: id,
        createdAt: createdAt,
        installType: installType,
        qty: qty,
        reportItem: reportItem!
            .map(
              (e) => ReportItem(
                id: e.id,
                name: e.name,
                sn: e.sn,
                qty: e.qty,
              ),
            )
            .toList(),
      );

  @override
  List<Object?> get props => [
        createdAt,
        installType,
        qty,
        reportItem,
      ];
}
