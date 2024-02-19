import 'package:memo/packages/packages.dart';

export 'course_item.dart';
export 'data_course.dart';

class Course extends Equatable {
  final List<DataCourse>? data;

  const Course({
    required this.data,
  });

  @override
  List<Object?> get props => [
        data,
      ];
}
