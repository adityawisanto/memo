import 'package:memo/packages/packages.dart';

class StatusBloc extends Bloc<StatusEvent, StatusState> {
  final GetCurrentStatus getCurrentStatus;

  StatusBloc(this.getCurrentStatus) : super(StatusInitialized()) {
    on<StatusGetted>(
      (event, emit) async {
        emit(StatusLoading());
        final result = await getCurrentStatus.get(
          event.type,
        );
        result.fold(
          (failure) {
            emit(
              StatusFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              StatusGetSuccess(
                data,
              ),
            );
          },
        );
      },
    );
    on<StatusSubmitted>(
      (event, emit) async {
        emit(StatusLoading());
        final result = await getCurrentStatus.post(
          event.idTicket,
          event.idStatus,
          event.idStatusDetail,
          event.statusTicket,
          event.notes,
        );
        result.fold(
          (failure) {
            emit(
              StatusFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              const StatusPostSuccess(
                "Success",
              ),
            );
          },
        );
      },
    );
  }
}
