import 'package:dartz/dartz.dart';
import 'package:memo/packages/packages.dart';

class GetCurrentAudit {
  final AuditRepository auditRepository;

  GetCurrentAudit(
    this.auditRepository,
  );

  Future<Either<Failure, Audit>> get() {
    return auditRepository.getCurrentAudit();
  }
}
