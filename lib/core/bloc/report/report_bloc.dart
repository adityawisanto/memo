import 'package:memo/packages/packages.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final GetCurrentReport getCurrentReport;

  ReportBloc(this.getCurrentReport) : super(ReportInitialized()) {
    on<ReportGetted>(
      (event, emit) async {
        emit(ReportLoading());
        final result = await getCurrentReport.get();
        result.fold(
          (failure) {
            emit(
              ReportFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              ReportGetSuccess(
                data,
              ),
            );
          },
        );
      },
    );
  }
}
