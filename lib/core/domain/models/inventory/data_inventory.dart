import 'package:memo/packages/packages.dart';

class DataInventory extends Equatable {
  final String? sn;
  final String? status;
  final int? qty;
  final String? date;

  const DataInventory({
    required this.sn,
    required this.status,
    required this.qty,
    required this.date,
  });

  @override
  List<Object?> get props => [
        sn,
        status,
        qty,
        date,
      ];
}
