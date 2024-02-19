import 'package:memo/packages/packages.dart';

const String ticketTable = 'ticket';

class TicketTable {
  final customSqflite = locator<CustomSqflite>();

  Future<void> createTicketTable(Database db) async {
    const id = 'INT';
    const tid = "TEXT";
    const merchantName = "TEXT";
    const address = "TEXT";
    const priority = "INT";
    const deadline = "TEXT";
    const status = "INT";
    const installType = "INT";
    const idSubTicket = "TEXT";
    const note = "TEXT";
    const pic = "TEXT";
    const phonePic = "TEXT";
    const poi = "INT";
    const openHours = "TEXT";
    const closeHours = "TEXT";
    const mid = "TEXT";
    const sn = "TEXT";
    const passcode = "TEXT";
    const typeInventory = "INT";
    const sla = "TEXT";
    const pinned = "TEXT";
    const doneDate = "TEXT";
    const thermal = "INT";

    await db.execute(
      'CREATE TABLE $ticketTable (ID $id, tid $tid, merchant_name $merchantName, address $address, priority $priority, deadline $deadline, idStatus $status, install_type $installType, subtiket_id $idSubTicket, detail $note, pic $pic, pic_phone $phonePic, poi $poi, open_hours $openHours, close_hours $closeHours, mid $mid, sn $sn, passcode $passcode, inventory_type $typeInventory, in_sla $sla, pinned $pinned, done_date $doneDate, thermalPaperRecomendation $thermal)',
    );
  }

  Future<int> createTicket(
    DataTicketModel dataTicketModel,
  ) async {
    final db = await customSqflite.database;
    return await db.insert(
      ticketTable,
      dataTicketModel.toJson(),
    );
  }

  Future<TicketModel> getTicket() async {
    final db = await customSqflite.database;
    final result = await db.query(
      ticketTable,
    );

    return TicketModel(
      data: result
          .map(
            (e) => DataTicketModel.fromJson(e),
          )
          .toList(),
    );
  }

  Future<int> truncateTicket() async {
    final db = await customSqflite.database;
    return await db.delete(ticketTable);
  }
}
