import 'package:memo/packages/packages.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetCurrentLogin getCurrentLogin;

  LoginBloc(this.getCurrentLogin) : super(LoginInitialized()) {
    on<LoginSubmitted>(
      (event, emit) async {
        emit(LoginLoading());
        final result = await getCurrentLogin.post(
          event.username,
          event.password,
        );
        result.fold(
          (failure) {
            emit(
              LoginFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              LoginPostSuccess(
                data,
              ),
            );
          },
        );
      },
    );
  }
}
