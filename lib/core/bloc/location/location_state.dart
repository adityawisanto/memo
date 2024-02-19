import 'package:memo/packages/packages.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object?> get props => [];
}

class LocationInitialized extends LocationState {}

class LocationLoading extends LocationState {}

class LocationPostSuccess extends LocationState {
  final String message;

  const LocationPostSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class LocationFailure extends LocationState {
  final String message;

  const LocationFailure(this.message);

  @override
  List<Object?> get props => [message];
}
