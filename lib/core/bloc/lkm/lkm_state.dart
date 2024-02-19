import 'package:memo/packages/packages.dart';

abstract class LkmState extends Equatable {
  const LkmState();

  @override
  List<Object?> get props => [];
}

class LkmInitialized extends LkmState {}

class LkmLoading extends LkmState {}

class LkmGetSuccess extends LkmState {
  final Lkm lkm;

  const LkmGetSuccess(this.lkm);

  @override
  List<Object?> get props => [lkm];
}

class LkmPostSuccess extends LkmState {
  final String message;

  const LkmPostSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class LkmFailure extends LkmState {
  final String message;

  const LkmFailure(this.message);

  @override
  List<Object?> get props => [message];
}
