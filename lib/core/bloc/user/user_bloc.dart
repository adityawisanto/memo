import 'package:memo/packages/packages.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetCurrentUser getCurrentUser;

  UserBloc(this.getCurrentUser) : super(UserInitialized()) {
    on<UserGetted>(
      (event, emit) async {
        emit(UserLoading());
        final result = await getCurrentUser.get();
        result.fold(
          (failure) {
            emit(
              UserFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              UserGetSuccess(
                data,
              ),
            );
          },
        );
      },
    );
    on<UserSubmitted>(
      (event, emit) async {
        emit(UserLoading());
        final result = await getCurrentUser.post(
          event.image,
        );
        result.fold(
          (failure) {
            emit(
              UserFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              UserPostSuccess(
                data,
              ),
            );
          },
        );
      },
    );
  }
}
