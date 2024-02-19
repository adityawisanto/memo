import 'package:memo/packages/packages.dart';

class AuditBloc extends Bloc<AuditEvent, AuditState> {
  final GetCurrentAudit getCurrentAudit;

  AuditBloc(this.getCurrentAudit) : super(AuditInitialized()) {
    on<AuditGetted>(
      (event, emit) async {
        emit(AuditLoading());
        final result = await getCurrentAudit.get();
        result.fold(
          (failure) {
            emit(
              AuditFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              AuditGetSuccess(
                data,
              ),
            );
          },
        );
      },
    );
  }
}
