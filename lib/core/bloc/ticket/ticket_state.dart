import 'package:memo/packages/packages.dart';

abstract class TicketState extends Equatable {
  const TicketState();

  @override
  List<Object?> get props => [];
}

class TicketInitialized extends TicketState {}

class TicketLoading extends TicketState {}

class TicketGetSuccess extends TicketState {
  final Ticket ticket;

  const TicketGetSuccess(this.ticket);

  @override
  List<Object?> get props => [ticket];
}

class TicketPostSuccess extends TicketState {
  final String message;

  const TicketPostSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class TicketFailure extends TicketState {
  final String message;

  const TicketFailure(this.message);

  @override
  List<Object?> get props => [message];
}
