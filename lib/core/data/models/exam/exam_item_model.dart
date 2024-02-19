import 'package:memo/packages/packages.dart';

class ExamItemModel extends Equatable {
  final int? id;
  final int? idExam;
  final String? answer;

  const ExamItemModel({
    required this.id,
    required this.idExam,
    required this.answer,
  });

  factory ExamItemModel.fromJson(Map<String, dynamic> json) {
    return ExamItemModel(
      id: json["id"],
      idExam: json["id_exam"],
      answer: json["answer"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_exam": idExam,
        "answer": answer,
      };

  ExamItem toEntity() => ExamItem(
        id: id,
        idExam: idExam,
        answer: answer,
      );

  @override
  List<Object?> get props => [
        id,
        idExam,
        answer,
      ];
}
