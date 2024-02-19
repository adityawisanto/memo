import 'package:memo/packages/packages.dart';

class SummaryDataStatistic extends Equatable {
  final int? installType;
  final int? idStatusTicket;
  final int? total;
  final int? inSla;
  final int? outSla;

  const SummaryDataStatistic({
    required this.installType,
    required this.idStatusTicket,
    required this.total,
    required this.inSla,
    required this.outSla,
  });

  @override
  List<Object?> get props => [
        installType,
        idStatusTicket,
        total,
        inSla,
        outSla,
      ];
}
