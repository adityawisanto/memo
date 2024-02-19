import 'package:memo/packages/packages.dart';

abstract class InventoryEvent extends Equatable {
  const InventoryEvent();

  @override
  List<Object?> get props => [];
}

class InventoryGetted extends InventoryEvent {
  final String? url;

  const InventoryGetted({
    required this.url,
  });

  @override
  List<Object?> get props => [
        url,
      ];
}
