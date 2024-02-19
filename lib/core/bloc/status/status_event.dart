import 'package:memo/packages/packages.dart';

abstract class StatusEvent extends Equatable {
  const StatusEvent();

  @override
  List<Object?> get props => [];
}

class StatusGetted extends StatusEvent {
  final String? type;

  const StatusGetted({
    required this.type,
  });

  @override
  List<Object?> get props => [
        type,
      ];
}

class StatusSubmitted extends StatusEvent {
  final int? idTicket;
  final int? idStatus;
  final int? idStatusDetail;
  final String? statusTicket;
  final String? notes;

  const StatusSubmitted({
    required this.idTicket,
    required this.idStatus,
    required this.idStatusDetail,
    required this.statusTicket,
    required this.notes,
  });

  @override
  List<Object?> get props => [
        idTicket,
        idStatus,
        idStatusDetail,
        statusTicket,
        notes,
      ];
}
