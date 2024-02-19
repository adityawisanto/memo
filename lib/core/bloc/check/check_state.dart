import 'package:memo/packages/packages.dart';

abstract class CheckState extends Equatable {
  const CheckState();

  @override
  List<Object?> get props => [];
}

class CheckInitialized extends CheckState {}

class CheckLoading extends CheckState {}

class CheckinPostSuccess extends CheckState {
  final Checkin checkin;

  const CheckinPostSuccess(this.checkin);

  @override
  List<Object?> get props => [checkin];
}

class CheckoutPostSuccess extends CheckState {
  final Checkout checkout;

  const CheckoutPostSuccess(this.checkout);

  @override
  List<Object?> get props => [checkout];
}

class CheckFailure extends CheckState {
  final String message;

  const CheckFailure(this.message);

  @override
  List<Object?> get props => [message];
}
