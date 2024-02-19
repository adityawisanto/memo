import 'package:memo/packages/packages.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetCurrentCourse getCurrentCourse;

  CourseBloc(this.getCurrentCourse) : super(CourseInitialized()) {
    on<CourseGetted>(
      (event, emit) async {
        emit(CourseLoading());
        final result = await getCurrentCourse.getCourse();
        result.fold(
          (failure) {
            emit(
              CourseFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              CourseGetSuccess(
                data,
              ),
            );
          },
        );
      },
    );
    on<CourseSearched>(
      (event, emit) async {
        emit(CourseLoading());
        final result = await getCurrentCourse.searchCourse(
          event.title,
        );
        result.fold(
          (failure) {
            emit(
              CourseFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              CourseSearchSuccess(
                data,
              ),
            );
          },
        );
      },
    );
  }
}
