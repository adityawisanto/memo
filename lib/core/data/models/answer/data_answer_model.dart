import 'package:memo/packages/packages.dart';

class DataAnswerModel extends Equatable {
  final int? score;
  final int? correct;

  const DataAnswerModel({
    required this.score,
    required this.correct,
  });

  factory DataAnswerModel.fromJson(Map<String, dynamic> json) {
    return DataAnswerModel(
      score: json["score"],
      correct: json["correct"],
    );
  }

  Map<String, dynamic> toJson() => {
        "score": score,
        "correct": correct,
      };

  DataAnswer toEntity() => DataAnswer(
        score: score,
        correct: correct,
      );

  @override
  List<Object?> get props => [
        score,
        correct,
      ];
}
