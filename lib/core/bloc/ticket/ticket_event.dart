import 'package:memo/packages/packages.dart';

abstract class TicketEvent extends Equatable {
  const TicketEvent();

  @override
  List<Object?> get props => [];
}

class TicketGetted extends TicketEvent {
  final String? type;
  final String? params;
  final String? search;
  final String? startDate;
  final String? endDate;
  final String? dateField;
  final int? page;
  final int? limit;

  const TicketGetted({
    required this.type,
    required this.params,
    required this.search,
    required this.startDate,
    required this.endDate,
    required this.dateField,
    required this.page,
    required this.limit,
  });

  @override
  List<Object?> get props => [
        type,
        params,
        search,
        startDate,
        endDate,
        dateField,
        page,
        limit,
      ];
}

class TicketSubmitted extends TicketEvent {
  final int? idTicket;

  const TicketSubmitted({
    required this.idTicket,
  });

  @override
  List<Object?> get props => [
        idTicket,
      ];
}
