import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class GetCurrentTicket {
  final TicketRepository ticketRepository;

  GetCurrentTicket(
    this.ticketRepository,
  );

  Future<Either<Failure, Ticket>> get(
    String? type,
    String? params,
    String? search,
    String? startDate,
    String? endDate,
    String? dateField,
    int? page,
    int? limit,
  ) {
    return ticketRepository.getCurrentTicket(
      type,
      params,
      search,
      startDate,
      endDate,
      dateField,
      page,
      limit,
    );
  }

  Future<Either<Failure, String>> post(
    int? idTicket,
  ) {
    return ticketRepository.postCurrentTicket(
      idTicket,
    );
  }
}
