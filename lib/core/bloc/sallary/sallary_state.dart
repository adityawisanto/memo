import 'package:memo/packages/packages.dart';

abstract class SallaryState extends Equatable {
  const SallaryState();

  @override
  List<Object?> get props => [];
}

class SallaryInitialized extends SallaryState {}

class SallaryLoading extends SallaryState {}

class SallaryGetSuccess extends SallaryState {
  final Sallary sallary;

  const SallaryGetSuccess(this.sallary);

  @override
  List<Object?> get props => [sallary];
}

class SallaryFailure extends SallaryState {
  final String message;

  const SallaryFailure(this.message);

  @override
  List<Object?> get props => [message];
}
