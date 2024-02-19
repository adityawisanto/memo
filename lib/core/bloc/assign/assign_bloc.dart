import 'package:memo/packages/packages.dart';

class AssignBloc extends Bloc<AssignEvent, AssignState> {
  final GetCurrentAssign getCurrentAssign;

  AssignBloc(this.getCurrentAssign) : super(AssignInitialized()) {
    on<AssignSubmitted>(
      (event, emit) async {
        emit(AssignLoading());
        final result = await getCurrentAssign.post(
          event.idAssign,
          event.status,
        );
        result.fold(
          (failure) {
            emit(
              AssignFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              AssignPostSuccess(
                data,
              ),
            );
          },
        );
      },
    );
  }
}
