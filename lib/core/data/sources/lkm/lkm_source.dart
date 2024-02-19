import 'package:memo/packages/packages.dart';

abstract class LkmSource {
  Future<LkmModel> getCurrentLkm();

  Future<String> postCurrentLkm(
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

class LkmSourceImpl implements LkmSource {
  final Dio dio;

  LkmSourceImpl({
    required this.dio,
  });

  @override
  Future<LkmModel> getCurrentLkm() async {
    try {
      return await LkmTable().getLkm();
    } catch (e) {
      throw const ServerException("Another Failure");
    }
  }

  @override
  Future<String> postCurrentLkm(
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
  ) async {
    try {
      final dataLkmModel = DataLkmModel(
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

      await LkmTable().createLkm(
        dataLkmModel,
      );
      return "Success";
    } catch (e) {
      throw const ServerException("Another Failure");
    }
  }
}
