import 'package:memo/packages/packages.dart';

const String lkmTable = "lkm";

class LkmTable {
  final customSqflite = locator<CustomSqflite>();

  Future<void> createLkmTable(Database db) async {
    const id = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const idTicket = "TEXT";
    const noTicket = "TEXT";
    const noLkm = "TEXT";
    const purchase = "TEXT";
    const brizzi = "TEXT";
    const qris = "TEXT";
    const help = "TEXT";
    const activity = "TEXT";
    const note = "TEXT";
    const anotherListEdc = "TEXT";
    const merchantType = "TEXT";
    const edcPrimary = "TEXT";
    const description = "TEXT";
    const edc = "TEXT";
    const edcWithdrawal = "TEXT";
    const item = "TEXT";
    const merchantImg = "TEXT";
    const cashierImg = "TEXT";
    const edcImg = "TEXT";
    const purchaseImg = "TEXT";
    const brizziImg = "TEXT";
    const qrisImg = "TEXT";
    const optionalImg = "TEXT";
    const optional2Img = "TEXT";
    const merchantName = "TEXT";
    const merchantNumber = "TEXT";
    const merchantSign = "TEXT";
    const officerName = "TEXT";
    const officerNumber = "TEXT";
    const officerSign = "TEXT";
    const idStatus = "INT";
    const idStatusDetail = "INT";
    const statusTicket = "TEXT";
    const merchantOpenTime = "TEXT";
    const merchantCloseTime = "TEXT";
    const merchantAddress = "TEXT";

    await db.execute(
      "CREATE TABLE $lkmTable (id $id, id_ticket $idTicket, no_ticket $noTicket, no_lkm $noLkm, purchase $purchase, brizzi $brizzi, qris $qris, help $help, activity $activity, note $note, anotherListEdc $anotherListEdc, merchant_type $merchantType, edc_primary $edcPrimary, description $description, edc $edc, edc_with_drawal $edcWithdrawal, item $item, merchant_img $merchantImg, cashier_img $cashierImg, edc_img $edcImg, purchase_img $purchaseImg, brizzi_img $brizziImg, qris_img $qrisImg, optional_img $optionalImg, optional2_img $optional2Img, merchant_name $merchantName, merchant_number $merchantNumber, merchant_sign $merchantSign, officer_name $officerName, officer_number $officerNumber, officer_sign $officerSign, id_status $idStatus, id_status_detail $idStatusDetail, status_ticket $statusTicket, merchant_open_time $merchantOpenTime, merchant_close_time $merchantCloseTime, merchant_address $merchantAddress)",
    );
  }

  Future<int> createLkm(
    DataLkmModel dataLkmModel,
  ) async {
    final db = await customSqflite.database;
    return await db.insert(
      lkmTable,
      dataLkmModel.toJson(),
    );
  }

  Future<LkmModel> getLkm() async {
    final db = await customSqflite.database;

    final result = await db.query(
      lkmTable,
      orderBy: "id DESC",
    );

    if (result.isNotEmpty) {
      return result
          .map(
            (e) => LkmModel(
              data: DataLkmModel.fromJson(e),
            ),
          )
          .first;
    } else {
      return const LkmModel(
        data: null,
      );
    }
  }

  Future<int> deleteLkm(String idTicket) async {
    final db = await customSqflite.database;

    return await db.delete(
      lkmTable,
      where: "id_ticket = ?",
      whereArgs: [idTicket],
    );
  }
}
