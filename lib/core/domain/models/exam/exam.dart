import 'package:memo/packages/packages.dart';

export 'data_exam.dart';
export 'exam_item.dart';

class Exam extends Equatable {
  final List<DataExam>? data;

  const Exam({
    required this.data,
  });

  @override
  List<Object?> get props => [
        data,
      ];
}

class ExamArgument extends Equatable {
  final CourseItem? courseItem;

  const ExamArgument({
    required this.courseItem,
  });

  @override
  List<Object?> get props => [
        courseItem,
      ];
}
