import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class TicketRepositoryImpl implements TicketRepository {
  final TicketSource ticketSource;

  const TicketRepositoryImpl({
    required this.ticketSource,
  });

  @override
  Future<Either<Failure, Ticket>> getCurrentTicket(
    String? type,
    String? params,
    String? search,
    String? startDate,
    String? endDate,
    String? dateField,
    int? page,
    int? limit,
  ) async {
    try {
      final result = await ticketSource.getCurrentTicket(
        type,
        params,
        search,
        startDate,
        endDate,
        dateField,
        page,
        limit,
      );
      return Right(
        result.toEntity(),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(e.error.toString()));
    } on SocketException {
      return const Left(ConnectionFailure(CustomResponse.noInternet));
    }
  }

  @override
  Future<Either<Failure, String>> postCurrentTicket(
    int? idTicket,
  ) async {
    try {
      final result = await ticketSource.postCurrentTicket(
        idTicket,
      );
      return Right(
        result,
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(e.error.toString()));
    } on SocketException {
      return const Left(ConnectionFailure(CustomResponse.noInternet));
    }
  }
}
