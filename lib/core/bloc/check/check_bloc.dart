import 'package:memo/packages/packages.dart';

class CheckBloc extends Bloc<CheckEvent, CheckState> {
  final GetCurrentCheck getCurrentCheck;

  CheckBloc(this.getCurrentCheck) : super(CheckInitialized()) {
    on<CheckinSubmitted>(
      (event, emit) async {
        emit(CheckLoading());
        final result = await getCurrentCheck.postCheckin();
        result.fold(
          (failure) {
            emit(
              CheckFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              CheckinPostSuccess(
                data,
              ),
            );
          },
        );
      },
    );
    on<CheckoutSubmitted>(
      (event, emit) async {
        emit(CheckLoading());
        final result = await getCurrentCheck.postCheckout();
        result.fold(
          (failure) {
            emit(
              CheckFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              CheckoutPostSuccess(
                data,
              ),
            );
          },
        );
      },
    );
  }
}
