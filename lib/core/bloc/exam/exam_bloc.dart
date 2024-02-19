import 'package:memo/packages/packages.dart';

class ExamBloc extends Bloc<ExamEvent, ExamState> {
  final GetCurrentExam getCurrentExam;

  ExamBloc(this.getCurrentExam) : super(ExamInitialized()) {
    on<ExamGetted>(
      (event, emit) async {
        emit(ExamLoading());
        final result = await getCurrentExam.getExam(
          event.id,
        );
        result.fold(
          (failure) {
            emit(
              ExamFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              ExamGetSuccess(
                data,
              ),
            );
          },
        );
      },
    );
  }
}
