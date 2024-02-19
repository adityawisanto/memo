import 'package:memo/packages/packages.dart';

abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object?> get props => [];
}

class CourseInitialized extends CourseState {}

class CourseLoading extends CourseState {}

class CourseGetSuccess extends CourseState {
  final Course course;

  const CourseGetSuccess(this.course);

  @override
  List<Object?> get props => [course];
}

class CourseSearchSuccess extends CourseState {
  final DataCourse dataCourse;

  const CourseSearchSuccess(this.dataCourse);

  @override
  List<Object?> get props => [dataCourse];
}

class CourseFailure extends CourseState {
  final String message;

  const CourseFailure(this.message);

  @override
  List<Object?> get props => [message];
}
