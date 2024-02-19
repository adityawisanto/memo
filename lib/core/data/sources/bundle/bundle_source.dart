import 'package:memo/packages/packages.dart';

abstract class BundleSource {
  Future<BundleModel> postCurrentBundle(
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

class BundleSourceImpl implements BundleSource {
  final Dio dio;
  final LkmBloc lkmBloc;

  BundleSourceImpl({
    required this.dio,
    required this.lkmBloc,
  });

  @override
  Future<BundleModel> postCurrentBundle(
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
      final response = await dio.post(
        CustomEnv().env("LKM"),
        data: {
          "id_ticket": idTicket,
          "no_ticket": noTicket,
          "no_lkm": noLkm,
          "checklist": {
            "purchase":
                purchase == "null" ? {} : json.decode(purchase.toString()),
            "brizzi": brizzi == "null" ? {} : json.decode(brizzi.toString()),
            "qris": qris == "null" ? {} : json.decode(qris.toString()),
            "help": help == "null" ? {} : json.decode(help.toString()),
            "aktivitas":
                activity == "null" ? {} : json.decode(activity.toString()),
            "note": note == "null" ? {} : json.decode(note.toString()),
            "tambahan": {
              "list_edc_lain": anotherListEdc,
              "tipe_merchant": merchantType,
              "edc_utama": edcPrimary,
              "keterangan": description,
            }
          },
          "EDC": edc,
          "EDC_penarikan": edcWithdrawal,
          "item": item == "{}" ? {} : json.decode(item.toString()),
          "model": Platform.isAndroid
              ? await CustomDevice().getModelAndroid()
              : await CustomDevice().getModelIos(),
          "manufacturer": Platform.isAndroid
              ? await CustomDevice().getManufactureAndroid()
              : await CustomDevice().getManufactureIos(),
          "os": Platform.operatingSystem,
          "sdk": Platform.operatingSystemVersion,
          "longitude": await CustomGeolocation().longitude(),
          "latitude": await CustomGeolocation().latitude(),
          "foto": {
            "merchant": merchantImg,
            "cashier": cashierImg,
            "edc": edcImg,
            "receipt_purchase": purchaseImg,
            "receipt_brizzi": brizziImg,
            "receipt_qris": qrisImg,
            "receipt_optional": optionalImg,
            "receipt_optional2": optional2Img,
          },
          "ttd": {
            "merchant_name": merchantName,
            "merchant_number": merchantNumber,
            "merchant_sign": merchantSign,
            "officer_name": officerName,
            "officer_number": officerNumber,
            "officer_sign": officerSign,
          },
          "idStatus": idStatus,
          "idStatusDetail": idStatusDetail,
          "status_ticket": statusTicket,
          "merchant_open_time": merchantOpenTime,
          "merchant_close_time": merchantCloseTime,
          "merchant_address": merchantAddress,
        },
      );
      return BundleModel.fromJson(response.data);
    } on DioException catch (e) {
      lkmBloc.add(
        LkmSubmitted(
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
        ),
      );
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        throw ServerException(e.response?.data["error"]);
      } else {
        throw const ServerException(CustomResponse.serverBusy);
      }
    }
  }
}
