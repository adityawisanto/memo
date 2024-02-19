import 'package:memo/packages/packages.dart';

class DataTicket extends Equatable {
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

  const DataTicket({
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
    required this.openHours,
    required this.closeHours,
    required this.phonePic,
    required this.poi,
    required this.mid,
    required this.sn,
    required this.passcode,
    required this.typeInventory,
    required this.sla,
    required this.pinned,
    required this.doneDate,
    required this.thermal,
  });

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
