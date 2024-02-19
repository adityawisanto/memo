import 'package:memo/packages/packages.dart';

abstract class SeenState extends Equatable {
  const SeenState();

  @override
  List<Object?> get props => [];
}

class SeenInitialized extends SeenState {}

class SeenLoading extends SeenState {}

class SeenPostSuccess extends SeenState {
  final String message;

  const SeenPostSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class SeenFailure extends SeenState {
  final String message;

  const SeenFailure(this.message);

  @override
  List<Object?> get props => [message];
}
