import 'package:memo/packages/packages.dart';

class SallaryBloc extends Bloc<SallaryEvent, SallaryState> {
  final GetCurrentSallary getCurrentSallary;

  SallaryBloc(this.getCurrentSallary) : super(SallaryInitialized()) {
    on<SallaryGetted>(
      (event, emit) async {
        emit(SallaryLoading());
        final result = await getCurrentSallary.get();
        result.fold(
          (failure) {
            emit(
              SallaryFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              SallaryGetSuccess(
                data,
              ),
            );
          },
        );
      },
    );
  }
}
