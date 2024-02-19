import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class GetCurrentStatus {
  final StatusRepository statusRepository;

  GetCurrentStatus(
    this.statusRepository,
  );

  Future<Either<Failure, Status>> get(
    String? type,
  ) {
    return statusRepository.getCurrentStatus(
      type,
    );
  }

  Future<Either<Failure, String>> post(
    int? idTicket,
    int? idStatus,
    int? idStatusDetail,
    String? statusTicket,
    String? notes,
  ) {
    return statusRepository.postCurrentStatus(
      idTicket,
      idStatus,
      idStatusDetail,
      statusTicket,
      notes,
    );
  }
}
