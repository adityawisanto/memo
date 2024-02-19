import 'package:memo/packages/packages.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitialized extends LoginState {}

class LoginLoading extends LoginState {}

class LoginPostSuccess extends LoginState {
  final Login login;

  const LoginPostSuccess(this.login);

  @override
  List<Object?> get props => [login];
}

class LoginFailure extends LoginState {
  final String message;

  const LoginFailure(this.message);

  @override
  List<Object?> get props => [message];
}
