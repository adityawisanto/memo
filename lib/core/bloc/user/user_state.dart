import 'package:memo/packages/packages.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitialized extends UserState {}

class UserLoading extends UserState {}

class UserGetSuccess extends UserState {
  final User user;

  const UserGetSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class UserPostSuccess extends UserState {
  final String message;

  const UserPostSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class UserFailure extends UserState {
  final String message;

  const UserFailure(this.message);

  @override
  List<Object?> get props => [message];
}
