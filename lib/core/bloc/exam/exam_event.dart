import 'package:memo/packages/packages.dart';

abstract class ExamEvent extends Equatable {
  const ExamEvent();

  @override
  List<Object?> get props => [];
}

class ExamGetted extends ExamEvent {
  final String? id;

  const ExamGetted({
    required this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
