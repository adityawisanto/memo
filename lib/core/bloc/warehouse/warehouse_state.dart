import 'package:memo/packages/packages.dart';

abstract class WarehouseState extends Equatable {
  const WarehouseState();

  @override
  List<Object?> get props => [];
}

class WarehouseInitialized extends WarehouseState {}

class WarehouseLoading extends WarehouseState {}

class WarehouseGetSuccess extends WarehouseState {
  final Warehouse warehouse;

  const WarehouseGetSuccess(this.warehouse);

  @override
  List<Object?> get props => [warehouse];
}

class WarehouseFailure extends WarehouseState {
  final String message;

  const WarehouseFailure(this.message);

  @override
  List<Object?> get props => [message];
}
