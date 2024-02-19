import 'package:memo/packages/packages.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final GetCurrentInventory getCurrentInventory;

  InventoryBloc(this.getCurrentInventory) : super(InventoryInitialized()) {
    on<InventoryGetted>(
      (event, emit) async {
        emit(InventoryLoading());
        final result = await getCurrentInventory.getInventory(
          event.url,
        );
        result.fold(
          (failure) {
            emit(
              InventoryFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              InventoryGetSuccess(
                data,
              ),
            );
          },
        );
      },
    );
  }
}
