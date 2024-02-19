import 'package:memo/packages/packages.dart';

class DataExam {
  final int? id;
  final int? idCourse;
  final String? question;
  String? correct;
  final List<ExamItem>? examItem;

  DataExam({
    this.id,
    this.idCourse,
    this.question,
    this.correct,
    this.examItem,
  });
}
