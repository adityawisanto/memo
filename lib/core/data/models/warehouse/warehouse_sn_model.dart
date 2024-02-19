import 'package:memo/packages/packages.dart';

class WarehouseSnModel extends Equatable {
  final int? idSn;
  final String? type;
  final String? sn;

  const WarehouseSnModel({
    required this.idSn,
    required this.type,
    required this.sn,
  });

  factory WarehouseSnModel.fromJson(Map<String, dynamic> json) {
    return WarehouseSnModel(
      idSn: json["id_sn"],
      type: json["type"],
      sn: json["sn"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id_sn": idSn,
        "type": type,
        "sn": sn,
      };

  WarehouseSn toEntity() => WarehouseSn(
        idSn: idSn,
        type: type,
        sn: sn,
      );

  @override
  List<Object?> get props => [
        idSn,
        type,
        sn,
      ];
}
