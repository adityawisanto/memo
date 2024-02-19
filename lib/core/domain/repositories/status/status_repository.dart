import 'package:dartz/dartz.dart';

import 'package:memo/packages/packages.dart';

abstract class StatusRepository {
  Future<Either<Failure, Status>> getCurrentStatus(
    String? type,
  );

  Future<Either<Failure, String>> postCurrentStatus(
    int? idTicket,
    int? idStatus,
    int? idStatusDetail,
    String? statusTicket,
    String? notes,
  );
}
