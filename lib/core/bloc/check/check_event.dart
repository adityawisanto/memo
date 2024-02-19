import 'package:memo/packages/packages.dart';

abstract class CheckEvent extends Equatable {
  const CheckEvent();

  @override
  List<Object?> get props => [];
}

class CheckinSubmitted extends CheckEvent {
  @override
  List<Object?> get props => [];
}

class CheckoutSubmitted extends CheckEvent {
  @override
  List<Object?> get props => [];
}
