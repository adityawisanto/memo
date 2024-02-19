import 'package:memo/packages/packages.dart';

class TicketModel extends Equatable {
  final List<DataTicketModel>? data;

  const TicketModel({
    required this.data,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      data: List<DataTicketModel>.from(
        json["data"].map(
          (x) => DataTicketModel.fromJson(x),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data,
      };

  Ticket toEntity() => Ticket(
        data: data!
            .map(
              (e) => DataTicket(
                id: e.id,
                tid: e.tid,
                merchantName: e.merchantName,
                address: e.address,
                priority: e.priority,
                deadline: e.deadline,
                status: e.status,
                installType: e.installType,
                idSubTicket: e.idSubTicket,
                note: e.note,
                pic: e.pic,
                openHours: e.openHours,
                closeHours: e.closeHours,
                phonePic: e.phonePic,
                poi: e.poi,
                mid: e.mid,
                sn: e.sn,
                passcode: e.passcode,
                typeInventory: e.typeInventory,
                sla: e.sla,
                pinned: e.pinned,
                doneDate: e.doneDate,
                thermal: e.thermal,
              ),
            )
            .toList(),
      );

  @override
  List<Object?> get props => [
        data,
      ];
}
