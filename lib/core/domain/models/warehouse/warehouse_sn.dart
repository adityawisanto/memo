import 'package:memo/packages/packages.dart';

class WarehouseSn extends Equatable {
  final int? idSn;
  final String? type;
  final String? sn;

  const WarehouseSn({
    required this.idSn,
    required this.type,
    required this.sn,
  });

  @override
  List<Object?> get props => [
        idSn,
        type,
        sn,
      ];
}
