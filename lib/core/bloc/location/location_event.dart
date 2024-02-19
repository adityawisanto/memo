import 'package:memo/packages/packages.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object?> get props => [];
}

class LocationSubmitted extends LocationEvent {
  @override
  List<Object?> get props => [];
}
