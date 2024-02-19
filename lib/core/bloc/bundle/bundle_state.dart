import 'package:memo/packages/packages.dart';

abstract class BundleState extends Equatable {
  const BundleState();

  @override
  List<Object?> get props => [];
}

class BundleInitialized extends BundleState {}

class BundleLoading extends BundleState {}

class BundlePostSuccess extends BundleState {
  final Bundle bundle;

  const BundlePostSuccess(this.bundle);

  @override
  List<Object?> get props => [bundle];
}

class BundleFailure extends BundleState {
  final String message;

  const BundleFailure(this.message);

  @override
  List<Object?> get props => [message];
}
