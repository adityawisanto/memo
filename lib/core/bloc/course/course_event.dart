import 'package:memo/packages/packages.dart';

abstract class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object?> get props => [];
}

class CourseGetted extends CourseEvent {
  @override
  List<Object?> get props => [];
}

class CourseSearched extends CourseEvent {
  final String? title;

  const CourseSearched({
    required this.title,
  });

  @override
  List<Object?> get props => [
        title,
      ];
}
