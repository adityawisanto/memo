import 'package:memo/packages/packages.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  final GetCurrentTicket getCurrentTicket;

  TicketBloc(this.getCurrentTicket) : super(TicketInitialized()) {
    on<TicketGetted>(
      (event, emit) async {
        emit(TicketLoading());
        final result = await getCurrentTicket.get(
          event.type,
          event.params,
          event.search,
          event.startDate,
          event.endDate,
          event.dateField,
          event.page,
          event.limit,
        );
        result.fold(
          (failure) {
            emit(
              TicketFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              TicketGetSuccess(
                data,
              ),
            );
          },
        );
      },
    );
    on<TicketSubmitted>(
      (event, emit) async {
        emit(TicketLoading());
        final result = await getCurrentTicket.post(
          event.idTicket,
        );
        result.fold(
          (failure) {
            emit(
              TicketFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              TicketPostSuccess(
                data,
              ),
            );
          },
        );
      },
    );
  }
}
