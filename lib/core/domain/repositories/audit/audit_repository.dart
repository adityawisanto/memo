import 'package:dartz/dartz.dart';

import 'package:memo/packages/packages.dart';

abstract class AuditRepository {
  Future<Either<Failure, Audit>> getCurrentAudit();
}
