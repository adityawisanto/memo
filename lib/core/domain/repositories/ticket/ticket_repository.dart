import 'package:dartz/dartz.dart';

import 'package:memo/packages/packages.dart';

abstract class TicketRepository {
  Future<Either<Failure, Ticket>> getCurrentTicket(
    String? type,
    String? params,
    String? search,
    String? startDate,
    String? endDate,
    String? dateField,
    int? page,
    int? limit,
  );

  Future<Either<Failure, String>> postCurrentTicket(
    int? idTicket,
  );
}
