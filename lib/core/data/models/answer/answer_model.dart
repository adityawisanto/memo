import 'package:memo/packages/packages.dart';

class AnswerModel extends Equatable {
  final DataAnswerModel? data;

  const AnswerModel({
    required this.data,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      data: DataAnswerModel.fromJson(
        json["data"],
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data,
      };

  Answer toEntity() => Answer(
        data: DataAnswer(
          score: data!.score,
          correct: data!.correct,
        ),
      );

  @override
  List<Object?> get props => [
        data,
      ];
}
