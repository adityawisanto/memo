import 'package:memo/packages/packages.dart';

class AnswerBloc extends Bloc<AnswerEvent, AnswerState> {
  final GetCurrentAnswer getCurrentAnswer;

  AnswerBloc(this.getCurrentAnswer) : super(AnswerInitialized()) {
    on<AnswerSubmitted>(
      (event, emit) async {
        emit(AnswerLoading());
        final result = await getCurrentAnswer.post(
          event.idCourse,
          event.answers,
        );
        result.fold(
          (failure) {
            emit(
              AnswerFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              AnswerPostSuccess(
                data,
              ),
            );
          },
        );
      },
    );
  }
}
