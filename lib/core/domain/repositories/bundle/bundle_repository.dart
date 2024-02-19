import 'package:dartz/dartz.dart';

import 'package:memo/packages/packages.dart';

abstract class BundleRepository {
  Future<Either<Failure, Bundle>> postCurrentBundle(
    String? idTicket,
    String? noTicket,
    String? noLkm,
    String? purchase,
    String? brizzi,
    String? qris,
    String? help,
    String? activity,
    String? note,
    String? anotherListEdc,
    String? merchantType,
    String? edcPrimary,
    String? description,
    String? edc,
    String? edcWithdrawal,
    String? item,
    String? merchantImg,
    String? cashierImg,
    String? edcImg,
    String? purchaseImg,
    String? brizziImg,
    String? qrisImg,
    String? optionalImg,
    String? optional2Img,
    String? merchantName,
    String? merchantNumber,
    String? merchantSign,
    String? officerName,
    String? officerNumber,
    String? officerSign,
    int? idStatus,
    int? idStatusDetail,
    String? statusTicket,
    String? merchantOpenTime,
    String? merchantCloseTime,
    String? merchantAddress,
  );
}
