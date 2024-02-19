import 'package:memo/packages/packages.dart';

export 'data_lkm.dart';

class Lkm extends Equatable {
  final DataLkm? data;

  const Lkm({
    required this.data,
  });

  @override
  List<Object?> get props => [
        data,
      ];
}

class LkmArgument extends Equatable {
  final DataTicket? dataTicket;
  final MasterDropdownTicketStatus? status;
  final DataStatus? dataStatus;
  final MasterDropdownEdc? edcPrimary;
  final MasterDropdownReason? reasonA;
  final MasterDropdownReason? reasonB;

  const LkmArgument({
    required this.dataTicket,
    required this.status,
    required this.dataStatus,
    required this.edcPrimary,
    required this.reasonA,
    required this.reasonB,
  });

  @override
  List<Object?> get props => [
        dataTicket,
        status,
        dataStatus,
        edcPrimary,
        reasonA,
        reasonB,
      ];
}
