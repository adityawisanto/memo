import 'package:memo/packages/packages.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  final GetCurrentSummary getCurrentSummary;

  SummaryBloc(this.getCurrentSummary) : super(SummaryInitialized()) {
    on<SummaryStatisticGetted>(
      (event, emit) async {
        emit(SummaryLoading());
        final result = await getCurrentSummary.get(
          event.startDate,
          event.endDate,
        );
        result.fold(
          (failure) {
            emit(
              SummaryFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              SummaryStatisticGetSuccess(
                data,
              ),
            );
          },
        );
      },
    );
  }
}
