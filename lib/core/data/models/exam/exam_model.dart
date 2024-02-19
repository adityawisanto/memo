import 'package:memo/packages/packages.dart';

class ExamModel extends Equatable {
  final List<DataExamModel>? data;

  const ExamModel({
    required this.data,
  });

  factory ExamModel.fromJson(
    Map<String, dynamic> json,
    List<ExamItemModel>? examItem,
  ) {
    return ExamModel(
      data: List<DataExamModel>.from(
        json["data"].map(
          (x) => DataExamModel.fromJson(
            x,
            examItem,
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data,
      };

  Exam toEntity() => Exam(
        data: data!
            .map(
              (e) => DataExam(
                id: e.id,
                question: e.question,
                correct: e.correct,
                examItem: e.examItem!
                    .map(
                      (e) => ExamItem(
                        id: e.id,
                        idExam: e.idExam,
                        answer: e.answer,
                      ),
                    )
                    .toList(),
              ),
            )
            .toList(),
      );

  @override
  List<Object?> get props => [
        data,
      ];
}
