import 'package:memo/packages/packages.dart';

abstract class InventoryState extends Equatable {
  const InventoryState();

  @override
  List<Object?> get props => [];
}

class InventoryInitialized extends InventoryState {}

class InventoryLoading extends InventoryState {}

class InventoryGetSuccess extends InventoryState {
  final Inventory inventory;

  const InventoryGetSuccess(this.inventory);

  @override
  List<Object?> get props => [inventory];
}

class InventoryFailure extends InventoryState {
  final String message;

  const InventoryFailure(this.message);

  @override
  List<Object?> get props => [message];
}
