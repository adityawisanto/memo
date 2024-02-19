import 'package:memo/packages/packages.dart';

class DataLkmModel extends Equatable {
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

  const DataLkmModel({
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

  factory DataLkmModel.fromJson(Map<String, dynamic> json) {
    return DataLkmModel(
      idTicket: json["id_ticket"],
      noTicket: json["no_ticket"],
      noLkm: json["no_lkm"],
      purchase: json["purchase"],
      brizzi: json["brizzi"],
      qris: json["qris"],
      help: json["help"],
      activity: json["activity"],
      note: json["note"],
      anotherListEdc: json["anotherListEdc"],
      merchantType: json["merchant_type"],
      edcPrimary: json["edc_primary"],
      description: json["description"],
      edc: json["edc"],
      edcWithdrawal: json["edc_with_drawal"],
      item: json["item"],
      merchantImg: json["merchant_img"],
      cashierImg: json["cashier_img"],
      edcImg: json["edc_img"],
      purchaseImg: json["purchase_img"],
      brizziImg: json["brizzi_img"],
      qrisImg: json["qris_img"],
      optionalImg: json["optional_img"],
      optional2Img: json["optional2_img"],
      merchantName: json["merchant_name"],
      merchantNumber: json["merchant_number"],
      merchantSign: json["merchant_sign"],
      officerName: json["officer_name"],
      officerNumber: json["officer_number"],
      officerSign: json["officer_sign"],
      idStatus: json["id_status"],
      idStatusDetail: json["id_status_detail"],
      statusTicket: json["status_ticket"],
      merchantOpenTime: json["merchant_open_time"],
      merchantCloseTime: json["merchant_close_time"],
      merchantAddress: json["merchant_address"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id_ticket": idTicket,
        "no_ticket": noTicket,
        "no_lkm": noLkm,
        "purchase": purchase,
        "brizzi": brizzi,
        "qris": qris,
        "help": help,
        "activity": activity,
        "note": note,
        "anotherListEdc": anotherListEdc,
        "merchant_type": merchantType,
        "edc_primary": edcPrimary,
        "description": description,
        "edc": edc,
        "edc_with_drawal": edcWithdrawal,
        "item": item,
        "merchant_img": merchantImg,
        "cashier_img": cashierImg,
        "edc_img": edcImg,
        "purchase_img": purchaseImg,
        "brizzi_img": brizziImg,
        "qris_img": qrisImg,
        "optional_img": optionalImg,
        "optional2_img": optional2Img,
        "merchant_name": merchantName,
        "merchant_number": merchantNumber,
        "merchant_sign": merchantSign,
        "officer_name": officerName,
        "officer_number": officerNumber,
        "officer_sign": officerSign,
        "id_status": idStatus,
        "id_status_detail": idStatusDetail,
        "status_ticket": statusTicket,
        "merchant_open_time": merchantOpenTime,
        "merchant_close_time": merchantCloseTime,
        "merchant_address": merchantAddress,
      };

  DataLkm toEntity() => DataLkm(
        idTicket: idTicket,
        noTicket: noTicket,
        noLkm: noLkm,
        purchase: purchase,
        brizzi: brizzi,
        qris: qris,
        help: help,
        activity: activity,
        note: note,
        anotherListEdc: anotherListEdc,
        merchantType: merchantType,
        edcPrimary: edcPrimary,
        description: description,
        edc: edc,
        edcWithdrawal: edcWithdrawal,
        item: item,
        merchantImg: merchantImg,
        cashierImg: cashierImg,
        edcImg: edcImg,
        purchaseImg: purchaseImg,
        brizziImg: brizziImg,
        qrisImg: qrisImg,
        optionalImg: optionalImg,
        optional2Img: optional2Img,
        merchantName: merchantName,
        merchantNumber: merchantNumber,
        merchantSign: merchantSign,
        officerName: officerName,
        officerNumber: officerNumber,
        officerSign: officerSign,
        idStatus: idStatus,
        idStatusDetail: idStatusDetail,
        statusTicket: statusTicket,
        merchantOpenTime: merchantOpenTime,
        merchantCloseTime: merchantCloseTime,
        merchantAddress: merchantAddress,
      );

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
