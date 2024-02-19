import 'package:memo/packages/packages.dart';

abstract class AuditState extends Equatable {
  const AuditState();

  @override
  List<Object?> get props => [];
}

class AuditInitialized extends AuditState {}

class AuditLoading extends AuditState {}

class AuditGetSuccess extends AuditState {
  final Audit audit;

  const AuditGetSuccess(this.audit);

  @override
  List<Object?> get props => [audit];
}

class AuditFailure extends AuditState {
  final String message;

  const AuditFailure(this.message);

  @override
  List<Object?> get props => [message];
}
