import 'package:memo/packages/packages.dart';

class WarehouseBloc extends Bloc<WarehouseEvent, WarehouseState> {
  final GetCurrentWarehouse getCurrentWarehouse;

  WarehouseBloc(this.getCurrentWarehouse) : super(WarehouseInitialized()) {
    on<WarehouseGetted>(
      (event, emit) async {
        emit(WarehouseLoading());
        final result = await getCurrentWarehouse.get();
        result.fold(
          (failure) {
            emit(
              WarehouseFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              WarehouseGetSuccess(
                data,
              ),
            );
          },
        );
      },
    );
  }
}
