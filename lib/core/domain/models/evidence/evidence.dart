import 'package:memo/packages/packages.dart';

class EvidenceArgument extends Equatable {
  final LkmArgument? lkmArgument;
  final Map<String, String>? purchase;
  final Map<String, String>? brizzi;
  final Map<String, String>? qris;
  final Map<String, String>? edcComplete;
  final Map<String, String>? activity;
  final Map<String, String>? note;
  final WarehouseSn? snEdcP1;
  final WarehouseSn? snEdcP2;
  final String? edcType;
  final String? sn;
  final List<DataWarehouse>? listItem;
  final String? clockOpen;
  final String? clockClose;
  final String? address;
  final MasterDropdownLkmMerchant? merchantType;
  final List<String>? anotherEdc;
  final String? visit;

  const EvidenceArgument({
    required this.lkmArgument,
    required this.purchase,
    required this.brizzi,
    required this.qris,
    required this.edcComplete,
    required this.activity,
    required this.note,
    required this.snEdcP1,
    required this.snEdcP2,
    required this.edcType,
    required this.sn,
    required this.listItem,
    required this.clockOpen,
    required this.clockClose,
    required this.address,
    required this.merchantType,
    required this.anotherEdc,
    required this.visit,
  });

  @override
  List<Object?> get props => [
        lkmArgument,
        purchase,
        brizzi,
        qris,
        edcComplete,
        activity,
        note,
        snEdcP1,
        snEdcP2,
        edcType,
        sn,
        listItem,
        clockOpen,
        clockClose,
        address,
        merchantType,
        anotherEdc,
        visit,
      ];
}
