import 'package:memo/packages/packages.dart';

abstract class ExamState extends Equatable {
  const ExamState();

  @override
  List<Object?> get props => [];
}

class ExamInitialized extends ExamState {}

class ExamLoading extends ExamState {}

class ExamGetSuccess extends ExamState {
  final Exam exam;

  const ExamGetSuccess(this.exam);

  @override
  List<Object?> get props => [exam];
}

class ExamFailure extends ExamState {
  final String message;

  const ExamFailure(this.message);

  @override
  List<Object?> get props => [message];
}
