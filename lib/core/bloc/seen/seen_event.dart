import 'package:memo/packages/packages.dart';

abstract class SeenEvent extends Equatable {
  const SeenEvent();

  @override
  List<Object?> get props => [];
}

class SeenSubmitted extends SeenEvent {
  @override
  List<Object?> get props => [];
}
