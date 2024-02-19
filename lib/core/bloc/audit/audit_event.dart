import 'package:memo/packages/packages.dart';

abstract class AuditEvent extends Equatable {
  const AuditEvent();

  @override
  List<Object?> get props => [];
}

class AuditGetted extends AuditEvent {
  @override
  List<Object?> get props => [];
}
