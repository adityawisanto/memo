import 'package:memo/packages/packages.dart';

class SummaryDataStatisticModel extends Equatable {
  final int? installType;
  final int? idStatusTicket;
  final int? total;
  final int? inSla;
  final int? outSla;

  const SummaryDataStatisticModel({
    required this.installType,
    required this.idStatusTicket,
    required this.total,
    required this.inSla,
    required this.outSla,
  });

  factory SummaryDataStatisticModel.fromJson(Map<String, dynamic> json) {
    return SummaryDataStatisticModel(
      installType: json["install_type"],
      idStatusTicket: json["id_status_ticket"],
      total: json["total"],
      inSla: json["in_sla"],
      outSla: json["out_sla"],
    );
  }

  Map<String, dynamic> toJson() => {
        "install_type": installType,
        "id_status_ticket": idStatusTicket,
        "total": total,
        "in_sla": inSla,
        "out_sla": outSla,
      };

  @override
  List<Object?> get props => [
        installType,
        idStatusTicket,
        total,
        inSla,
        outSla,
      ];
}
