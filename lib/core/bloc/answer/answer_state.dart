import 'package:memo/packages/packages.dart';

abstract class AnswerState extends Equatable {
  const AnswerState();

  @override
  List<Object?> get props => [];
}

class AnswerInitialized extends AnswerState {}

class AnswerLoading extends AnswerState {}

class AnswerPostSuccess extends AnswerState {
  final Answer answer;

  const AnswerPostSuccess(this.answer);

  @override
  List<Object?> get props => [answer];
}

class AnswerFailure extends AnswerState {
  final String message;

  const AnswerFailure(this.message);

  @override
  List<Object?> get props => [message];
}
