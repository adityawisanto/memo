import 'package:memo/packages/packages.dart';

class DataReport extends Equatable {
  final int? id;
  final String? createdAt;
  final int? installType;
  final int? qty;
  final List<ReportItem>? reportItem;

  const DataReport({
    required this.id,
    required this.createdAt,
    required this.installType,
    required this.qty,
    required this.reportItem,
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        installType,
        qty,
        reportItem,
      ];
}
