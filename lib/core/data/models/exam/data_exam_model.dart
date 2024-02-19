import 'package:memo/packages/packages.dart';

class DataExamModel extends Equatable {
  final int? id;
  final int? idCourse;
  final String? question;
  final String? correct;
  final List<ExamItemModel>? examItem;

  const DataExamModel({
    required this.id,
    required this.idCourse,
    required this.question,
    required this.correct,
    required this.examItem,
  });

  factory DataExamModel.fromJson(
    Map<String, dynamic> json,
    List<ExamItemModel>? examItem,
  ) {
    return DataExamModel(
      id: json["id"],
      idCourse: json["id_course"],
      question: json["question"],
      correct: json["correct"],
      examItem: examItem,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_course": idCourse,
        "question": question,
        "correct": correct,
      };

  DataExam toEntity() => DataExam(
        id: id,
        idCourse: idCourse,
        question: question,
        correct: correct,
        examItem: examItem!
            .map(
              (e) => ExamItem(
                id: e.id,
                idExam: e.idExam,
                answer: e.answer,
              ),
            )
            .toList(),
      );

  @override
  List<Object?> get props => [
        id,
        idCourse,
        question,
        correct,
        examItem,
      ];
}
