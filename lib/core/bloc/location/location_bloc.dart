import 'package:memo/packages/packages.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetCurrentLocation getCurrentLocation;

  LocationBloc(this.getCurrentLocation) : super(LocationInitialized()) {
    on<LocationSubmitted>(
      (event, emit) async {
        emit(LocationLoading());
        final result = await getCurrentLocation.post();
        result.fold(
          (failure) {
            emit(
              LocationFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              LocationPostSuccess(
                data,
              ),
            );
          },
        );
      },
    );
  }
}
