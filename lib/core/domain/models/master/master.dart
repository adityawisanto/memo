import 'package:memo/packages/packages.dart';

class MasterDropdownLkmMerchant {
  String? title;

  MasterDropdownLkmMerchant(
    this.title,
  );
}

List<MasterDropdownLkmMerchant> dataMasterDropdownLkmMerchant = [
  MasterDropdownLkmMerchant(
    "Makanan / Minuman",
  ),
  MasterDropdownLkmMerchant(
    "Fashion (Pakaian, Sepatu, Tas, dll)",
  ),
  MasterDropdownLkmMerchant(
    "Elektronik (HP, TV, Komputer, Kelistrikan, Peralatan Rumah Tangga)",
  ),
  MasterDropdownLkmMerchant(
    "Otomotif / Bengkel / Cuci Mobil / dll",
  ),
  MasterDropdownLkmMerchant(
    "Toko Serba Ada (Warung, Minimarket, Supermarket)",
  ),
  MasterDropdownLkmMerchant(
    "Lain-lain yang tidak tercantum di atas",
  ),
];

class MasterDropdownEdc {
  int id;
  String? title;

  MasterDropdownEdc(
    this.id,
    this.title,
  );
}

List<MasterDropdownEdc> dataMasterDropdownEdc = [
  MasterDropdownEdc(
    1,
    "EDC diletakkan di atas Meja Kasir",
  ),
  MasterDropdownEdc(
    2,
    "EDC disimpan di Laci / tidak terlihat di Meja Kasir",
  ),
];

class MasterDropdownTicketStatus {
  String? title;

  MasterDropdownTicketStatus(
    this.title,
  );
}

List<MasterDropdownTicketStatus> dataMasterDropdownTicketStatus = [
  MasterDropdownTicketStatus(
    "OnProgress",
  ),
  MasterDropdownTicketStatus(
    "Pending",
  ),
  MasterDropdownTicketStatus(
    "Done",
  ),
];

class MasterDropdownReason {
  String? title;

  MasterDropdownReason(
    this.title,
  );
}

List<MasterDropdownReason> dataMasterDropdownReasonA = [
  MasterDropdownReason(
    "Dipakai untuk kartu BRI saja",
  ),
  MasterDropdownReason(
    "Dipakai jika ada Promo dari BRI",
  ),
  MasterDropdownReason(
    "Dipakai sebagai EDC utama (semua transaksi) pakai EDC BRI",
  ),
  MasterDropdownReason(
    "Tidak dipakai sesuai arahan management",
  ),
];

List<MasterDropdownReason> dataMasterDropdownReasonB = [
  MasterDropdownReason(
    "Arahan management",
  ),
  MasterDropdownReason(
    "Dipakai jika ada Promo",
  ),
  MasterDropdownReason(
    "Tidak ada pengguna BRI",
  ),
  MasterDropdownReason(
    "Sering gangguan / error",
  ),
];

class MasterJsonTicket {
  static const ttImpln = "1";
  static const ttImplr = "2";
  static const ttCm = "3";
  static const ttPm = "4";
  static const ttDist = "5";
  static const ttHand = "6";
  static const ttSm = "7";

  static const ttOnProgress = "1";
  static const ttPending = "2";
  static const ttDone = "3";
  static const ttDoneNegative = "8";

  static const ttInSla = "true";
  static const ttOutSla = "false";

  String? statusWithText(String? type) {
    switch (type) {
      case "0":
        return "Open";
      case "1":
        return "OnProgress";
      case "2":
        return "Pending";
      case "3":
        return "Done";
      case "8":
        return "Done-Negatif";
      default:
        return "Open";
    }
  }

  Color? statusWithColor(String? type) {
    switch (type) {
      case "1":
        return CustomColorStyle.bluePrimary;
      case "2":
        return CustomColorStyle.yellowPrimary;
      case "3":
        return CustomColorStyle.greenPrimary;
      case "8":
        return CustomColorStyle.orangePrimary;
      default:
        return CustomColorStyle.orangePrimary;
    }
  }

  String? typeWithText(String? type) {
    switch (type) {
      case "1":
        return "Installation - New SIK";
      case "2":
        return "Installation - Replacement";
      case "3":
        return "Corrective Maintenance";
      case "4":
        return "Preventive Maintenance";
      case "5":
        return "Dismantle";
      case "6":
        return "Handling";
      case "7":
        return "Support Maintenance";
      default:
        return "Other";
    }
  }

  String? priorityWithText(String? ticketType) {
    switch (ticketType) {
      case "1":
        return "Low";
      case "2":
        return "Medium";
      case "3":
        return "High";
      case "4":
        return "Critical";
      default:
        return "Medium";
    }
  }

  IconData? priorityWithIcon(String? ticketType) {
    switch (ticketType) {
      case "1":
        return Icons.keyboard_arrow_down;
      case "2":
        return Icons.keyboard_arrow_up;
      case "3":
        return Icons.keyboard_double_arrow_up;
      case "4":
        return Icons.keyboard_double_arrow_up;
      default:
        return Icons.keyboard_arrow_up;
    }
  }

  String? installationType(String? ticketType) {
    switch (ticketType) {
      case "1":
        return "impn";
      case "2":
        return "impk";
      case "3":
        return "cm";
      case "4":
        return "pm";
      case "5":
        return "dm";
      case "6":
        return "hm";
      case "7":
        return "sm";
      default:
        return "";
    }
  }

  String? generateNoLkm(String? ticketType) {
    switch (ticketType) {
      case "1":
        return "Impn";
      case "2":
        return "Impk";
      case "3":
        return "CM";
      case "4":
        return "PM";
      case "5":
        return "Dist";
      case "6":
        return "Hand";
      case "7":
        return "Supp";
      default:
        return "Other";
    }
  }
}

class MasterJsonWarehouse {
  String? typeWithImage(String? type) {
    switch (type) {
      case "Kabel USB":
        return "assets/images/warehouse/cable.svg";
      case "Adaptor":
        return "assets/images/warehouse/adaptor.svg";
      case "Thermal paper":
        return "assets/images/warehouse/thermal.svg";
      case "Manual Book":
        return "assets/images/warehouse/book.svg";
      case "Rak Besi":
        return "assets/images/warehouse/rack.svg";
      case "Stiker EDC":
        return "assets/images/warehouse/sticker.svg";
      default:
        return "Open";
    }
  }
}
