import 'package:memo/packages/packages.dart';

class LkmBloc extends Bloc<LkmEvent, LkmState> {
  final GetCurrentLkm getCurrentLkm;

  LkmBloc(this.getCurrentLkm) : super(LkmInitialized()) {
    on<LkmGetted>(
      (event, emit) async {
        emit(LkmLoading());
        final result = await getCurrentLkm.getLkm(
          event.idTicket,
        );
        result.fold(
          (failure) {
            emit(
              LkmFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              LkmGetSuccess(
                data,
              ),
            );
          },
        );
      },
    );
    on<LkmSubmitted>(
      (event, emit) async {
        emit(LkmLoading());
        final result = await getCurrentLkm.postLkm(
          event.idTicket,
          event.noTicket,
          event.noLkm,
          event.purchase,
          event.brizzi,
          event.qris,
          event.help,
          event.activity,
          event.note,
          event.anotherListEdc,
          event.merchantType,
          event.edcPrimary,
          event.description,
          event.edc,
          event.edcWithdrawal,
          event.item,
          event.merchantImg,
          event.cashierImg,
          event.edcImg,
          event.purchaseImg,
          event.brizziImg,
          event.qrisImg,
          event.optionalImg,
          event.optional2Img,
          event.merchantName,
          event.merchantNumber,
          event.merchantSign,
          event.officerName,
          event.officerNumber,
          event.officerSign,
          event.idStatus,
          event.idStatusDetail,
          event.statusTicket,
          event.merchantOpenTime,
          event.merchantCloseTime,
          event.merchantAddress,
        );
        result.fold(
          (failure) {
            emit(
              LkmFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              const LkmPostSuccess(
                "Success",
              ),
            );
          },
        );
      },
    );
  }
}
