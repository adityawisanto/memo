import 'package:memo/packages/packages.dart';

abstract class LkmEvent extends Equatable {
  const LkmEvent();

  @override
  List<Object?> get props => [];
}

class LkmGetted extends LkmEvent {
  final String? idTicket;

  const LkmGetted({
    required this.idTicket,
  });

  @override
  List<Object?> get props => [
        idTicket,
      ];
}

class LkmSubmitted extends LkmEvent {
  final String? idTicket;
  final String? noTicket;
  final String? noLkm;
  final String? purchase;
  final String? brizzi;
  final String? qris;
  final String? help;
  final String? activity;
  final String? note;
  final String? anotherListEdc;
  final String? merchantType;
  final String? edcPrimary;
  final String? description;
  final String? edc;
  final String? edcWithdrawal;
  final String? item;
  final String? merchantImg;
  final String? cashierImg;
  final String? edcImg;
  final String? purchaseImg;
  final String? brizziImg;
  final String? qrisImg;
  final String? optionalImg;
  final String? optional2Img;
  final String? merchantName;
  final String? merchantNumber;
  final String? merchantSign;
  final String? officerName;
  final String? officerNumber;
  final String? officerSign;
  final int? idStatus;
  final int? idStatusDetail;
  final String? statusTicket;
  final String? merchantOpenTime;
  final String? merchantCloseTime;
  final String? merchantAddress;

  const LkmSubmitted({
    required this.idTicket,
    required this.noTicket,
    required this.noLkm,
    required this.purchase,
    required this.brizzi,
    required this.qris,
    required this.help,
    required this.activity,
    required this.note,
    required this.anotherListEdc,
    required this.merchantType,
    required this.edcPrimary,
    required this.description,
    required this.edc,
    required this.edcWithdrawal,
    required this.item,
    required this.merchantImg,
    required this.cashierImg,
    required this.edcImg,
    required this.purchaseImg,
    required this.brizziImg,
    required this.qrisImg,
    required this.optionalImg,
    required this.optional2Img,
    required this.merchantName,
    required this.merchantNumber,
    required this.merchantSign,
    required this.officerName,
    required this.officerNumber,
    required this.officerSign,
    required this.idStatus,
    required this.idStatusDetail,
    required this.statusTicket,
    required this.merchantOpenTime,
    required this.merchantCloseTime,
    required this.merchantAddress,
  });

  @override
  List<Object?> get props => [
        idTicket,
        noTicket,
        noLkm,
        purchase,
        brizzi,
        qris,
        help,
        activity,
        note,
        anotherListEdc,
        merchantType,
        edcPrimary,
        description,
        edc,
        edcWithdrawal,
        item,
        merchantImg,
        cashierImg,
        edcImg,
        purchaseImg,
        brizziImg,
        qrisImg,
        optionalImg,
        optional2Img,
        merchantName,
        merchantNumber,
        merchantSign,
        officerName,
        officerNumber,
        officerSign,
        idStatus,
        idStatusDetail,
        statusTicket,
        merchantOpenTime,
        merchantCloseTime,
        merchantAddress,
      ];
}
