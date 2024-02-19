import 'package:memo/packages/packages.dart';

class LkmModel extends Equatable {
  final DataLkmModel? data;

  const LkmModel({
    required this.data,
  });

  factory LkmModel.fromJson(Map<String, dynamic> json) {
    return LkmModel(
      data: DataLkmModel.fromJson(
        json["data"],
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data,
      };

  Lkm toEntity() => Lkm(
        data: DataLkm(
          idTicket: data!.idTicket,
          noTicket: data!.noTicket,
          noLkm: data!.noLkm,
          purchase: data!.purchase,
          brizzi: data!.brizzi,
          qris: data!.qris,
          help: data!.help,
          activity: data!.activity,
          note: data!.note,
          anotherListEdc: data!.anotherListEdc,
          merchantType: data!.merchantType,
          edcPrimary: data!.edcPrimary,
          description: data!.description,
          edc: data!.edc,
          edcWithdrawal: data!.edcWithdrawal,
          item: data!.item,
          merchantImg: data!.merchantImg,
          cashierImg: data!.cashierImg,
          edcImg: data!.edcImg,
          purchaseImg: data!.purchaseImg,
          brizziImg: data!.brizziImg,
          qrisImg: data!.qrisImg,
          optionalImg: data!.optionalImg,
          optional2Img: data!.optional2Img,
          merchantName: data!.merchantName,
          merchantNumber: data!.merchantNumber,
          merchantSign: data!.merchantSign,
          officerName: data!.officerName,
          officerNumber: data!.officerNumber,
          officerSign: data!.officerSign,
          idStatus: data!.idStatus,
          idStatusDetail: data!.idStatusDetail,
          statusTicket: data!.statusTicket,
          merchantOpenTime: data!.merchantOpenTime,
          merchantCloseTime: data!.merchantCloseTime,
          merchantAddress: data!.merchantAddress,
        ),
      );

  @override
  List<Object?> get props => [
        data,
      ];
}
