import 'package:memo/packages/packages.dart';

class DataTicketModel extends Equatable {
  final int? id;
  final String? tid;
  final String? merchantName;
  final String? address;
  final int? priority;
  final String? deadline;
  final int? status;
  final int? installType;
  final String? idSubTicket;
  final String? note;
  final String? pic;
  final String? openHours;
  final String? closeHours;
  final String? phonePic;
  final int? poi;
  final String? mid;
  final String? sn;
  final String? passcode;
  final int? typeInventory;
  final String? sla;
  final String? pinned;
  final String? doneDate;
  final int? thermal;

  const DataTicketModel({
    required this.id,
    required this.tid,
    required this.merchantName,
    required this.address,
    required this.priority,
    required this.deadline,
    required this.status,
    required this.installType,
    required this.idSubTicket,
    required this.note,
    required this.pic,
    required this.phonePic,
    required this.poi,
    required this.openHours,
    required this.closeHours,
    required this.mid,
    required this.sn,
    required this.passcode,
    required this.typeInventory,
    required this.sla,
    required this.pinned,
    required this.doneDate,
    required this.thermal,
  });

  factory DataTicketModel.fromJson(Map<String, dynamic> json) {
    return DataTicketModel(
      id: json["ID"],
      tid: json["tid"],
      merchantName: json["merchant_name"],
      address: json["address"],
      priority: json["priority"],
      deadline: json["deadline"],
      status: json["idStatus"],
      installType: json["install_type"],
      idSubTicket: json["subtiket_id"],
      note: json["detail"],
      pic: json["pic"],
      openHours: json["open_hours"],
      closeHours: json["close_hours"],
      phonePic: json["pic_phone"],
      poi: json["poi"],
      mid: json["mid"],
      sn: json["sn"],
      passcode: json["passcode"],
      typeInventory: json["inventory_type"],
      sla: json["in_sla"].toString(),
      pinned: json["pinned"].toString(),
      doneDate: json["done_date"],
      thermal: json["thermalPaperRecomendation"],
    );
  }

  Map<String, dynamic> toJson() => {
        "ID": id,
        "tid": tid,
        "merchant_name": merchantName,
        "address": address,
        "priority": priority,
        "deadline": deadline,
        "idStatus": status,
        "install_type": installType,
        "subtiket_id": idSubTicket,
        "detail": note,
        "pic": pic,
        "open_hours": openHours,
        "close_hours": closeHours,
        "pic_phone": phonePic,
        "poi": poi,
        "mid": mid,
        "sn": sn,
        "passcode": passcode,
        "inventory_type": typeInventory,
        "in_sla": sla,
        "pinned": pinned,
        "done_date": doneDate,
        "thermalPaperRecomendation": thermal,
      };

  DataTicket toEntity() => DataTicket(
        id: id,
        tid: tid,
        merchantName: merchantName,
        address: address,
        priority: priority,
        deadline: deadline,
        status: status,
        installType: installType,
        idSubTicket: idSubTicket,
        note: note,
        pic: pic,
        openHours: openHours,
        closeHours: closeHours,
        phonePic: phonePic,
        poi: poi,
        mid: mid,
        sn: sn,
        passcode: passcode,
        typeInventory: typeInventory,
        sla: sla,
        pinned: pinned,
        doneDate: doneDate,
        thermal: thermal,
      );

  @override
  List<Object?> get props => [
        id,
        tid,
        merchantName,
        address,
        priority,
        deadline,
        status,
        installType,
        idSubTicket,
        note,
        pic,
        openHours,
        closeHours,
        phonePic,
        poi,
        mid,
        sn,
        passcode,
        typeInventory,
        sla,
        pinned,
        doneDate,
        thermal,
      ];
}
