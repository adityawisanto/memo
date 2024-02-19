import 'package:memo/packages/packages.dart';

class BundleBloc extends Bloc<BundleEvent, BundleState> {
  final GetCurrentBundle getCurrentBundle;

  BundleBloc(this.getCurrentBundle) : super(BundleInitialized()) {
    on<BundleSubmitted>(
      (event, emit) async {
        emit(BundleLoading());
        final result = await getCurrentBundle.post(
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
              BundleFailure(
                failure.message,
              ),
            );
          },
          (data) {
            emit(
              BundlePostSuccess(
                data,
              ),
            );
          },
        );
      },
    );
  }
}
