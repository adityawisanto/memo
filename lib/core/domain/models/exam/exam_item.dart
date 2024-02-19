import 'package:memo/packages/packages.dart';

class ExamItem extends Equatable {
  final int? id;
  final int? idExam;
  final String? answer;

  const ExamItem({
    required this.id,
    required this.idExam,
    required this.answer,
  });

  @override
  List<Object?> get props => [
        id,
        idExam,
        answer,
      ];
}
