import 'package:memo/packages/packages.dart';

abstract class StatusState extends Equatable {
  const StatusState();

  @override
  List<Object?> get props => [];
}

class StatusInitialized extends StatusState {}

class StatusLoading extends StatusState {}

class StatusGetSuccess extends StatusState {
  final Status status;

  const StatusGetSuccess(this.status);

  @override
  List<Object?> get props => [status];
}

class StatusPostSuccess extends StatusState {
  final String message;

  const StatusPostSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class StatusFailure extends StatusState {
  final String message;

  const StatusFailure(this.message);

  @override
  List<Object?> get props => [message];
}
