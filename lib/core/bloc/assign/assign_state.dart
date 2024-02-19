import 'package:memo/packages/packages.dart';

abstract class AssignState extends Equatable {
  const AssignState();

  @override
  List<Object?> get props => [];
}

class AssignInitialized extends AssignState {}

class AssignLoading extends AssignState {}

class AssignPostSuccess extends AssignState {
  final String message;

  const AssignPostSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class AssignFailure extends AssignState {
  final String message;

  const AssignFailure(this.message);

  @override
  List<Object?> get props => [message];
}
