import 'package:memo/packages/packages.dart';

class SeenBloc extends Bloc<SeenEvent, SeenState> {
  final GetCurrentSeen getCurrentSeen;

  SeenBloc(this.getCurrentSeen) : super(SeenInitialized()) {
    on<SeenSubmitted>(
      (event, emit) async {
        emit(SeenLoading());
        final result = await getCurrentSeen.post();
        result.fold(
          (failure) {
            emit(
              SeenFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              SeenPostSuccess(
                data,
              ),
            );
          },
        );
      },
    );
  }
}
