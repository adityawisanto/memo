import 'package:memo/packages/packages.dart';

class ReportItem extends Equatable {
  final int? id;
  final String? name;
  final String? sn;
  final int? qty;

  const ReportItem({
    required this.id,
    required this.name,
    required this.sn,
    required this.qty,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        sn,
        qty,
      ];
}
