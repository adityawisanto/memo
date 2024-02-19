import 'package:memo/packages/packages.dart';

class CustomPreferences {
  CustomPreferences();

  static const token = "Token";
  static const verifyToken = "VerifyToken";
  static const check = "Check";
  static const username = "Username";
  static const phone = "Phone";
  static const idUser = "IdUser";
  static const avatar = "Avatar";
  static const connection = "Connection";

  static const sign = "Sign";
  static const cashier = "Cashier";
  static const edc = "Edc";
  static const struk = "Struk";
  static const brizzi = "Brizzi";
  static const qris = "Qris";
  static const optional = "Optional";
  static const optional2 = "Optional2";

  static const work = "work";
  static const hb = "hb";
  static const lkm = "lkm";
  static const notif = "notif";

  static const loginIntro = "LoginIntro";
  static const homeIntro = "HomeIntro";
  static const ticketIntro = "TicketIntro";
  static const stockInventoryIntro = "StockInventoryIntro";
  static const stockHistoryIntro = "StockHistoryIntro";
  static const stockDetailIntro = "StockDetailIntro";
  static const summaryStatisticIntro = "SummaryStatisticIntro";
  static const summaryHistoryIntro = "SummaryHistoryIntro";
  static const courseIntro = "CourseIntro";
  static const modulIntro = "ModulIntro";
  static const merchantIntro = "MerchantIntro";
  static const lkmPendingIntro = "LKMPendingIntro";
  static const lkmDoneIntro = "LKMDoneIntro";
  static const evidenceIntro = "EvidenceIntro";
  static const signatureIntro = "SignatureIntro";
  static const profileIntro = "ProfileIntro";

  // **************** Save Method Only **************** //
  Future<void> saveToken(String value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(token, value);
  }

  Future<void> saveVerifyToken(String value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(verifyToken, value);
  }

  Future<bool> saveCheck(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setBool(check, value);
  }

  Future<void> saveUsername(String value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(username, value);
  }

  Future<void> savePhone(String value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(phone, value);
  }

  Future<void> saveIdUser(String value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(idUser, value);
  }

  Future<void> saveAvatar(String value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(avatar, value);
  }

  Future<void> saveConnection(int value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt(connection, value);
  }

  Future<void> saveSign(String value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(sign, value);
  }

  Future<void> saveCashier(String value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(cashier, value);
  }

  Future<void> saveEdc(String value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(edc, value);
  }

  Future<void> saveStruk(String value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(struk, value);
  }

  Future<void> saveBrizzi(String value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(brizzi, value);
  }

  Future<void> saveQris(String value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(qris, value);
  }

  Future<void> saveOptional(String value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(optional, value);
  }

  Future<void> saveOptional2(String value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(optional2, value);
  }

  Future<void> saveWork(int value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt(work, value);
  }

  Future<void> saveHb(int value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt(hb, value);
  }

  Future<void> saveLkm(int value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt(lkm, value);
  }

  Future<void> saveNotif(int value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt(notif, value);
  }

  Future<void> saveLoginIntro(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(loginIntro, value);
  }

  Future<void> saveHomeIntro(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(homeIntro, value);
  }

  Future<void> saveTicketIntro(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(ticketIntro, value);
  }

  Future<void> saveStockInventoryIntro(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(stockInventoryIntro, value);
  }

  Future<void> saveStockHistoryIntro(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(stockHistoryIntro, value);
  }

  Future<void> saveStockDetailIntro(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(stockDetailIntro, value);
  }

  Future<void> saveSummaryStatisticIntro(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(summaryStatisticIntro, value);
  }

  Future<void> saveSummaryHistoryIntro(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(summaryHistoryIntro, value);
  }

  Future<void> saveCourseIntro(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(courseIntro, value);
  }

  Future<void> saveModulIntro(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(modulIntro, value);
  }

  Future<void> saveMerchantIntro(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(merchantIntro, value);
  }

  Future<void> saveLkmPendingIntro(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(lkmPendingIntro, value);
  }

  Future<void> saveLkmDoneIntro(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(lkmDoneIntro, value);
  }

  Future<void> saveEvidenceIntro(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(evidenceIntro, value);
  }

  Future<void> saveSignatureIntro(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(signatureIntro, value);
  }

  Future<void> saveProfileIntro(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(profileIntro, value);
  }

  // **************** Get Method Only **************** //
  Future<String> getToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(token) ?? "";
  }

  Future<int> getConnection() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(connection) ?? 0;
  }

  Future<String> getVerifyToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(verifyToken) ?? "";
  }

  Future<bool> getCheck() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(check) ?? false;
  }

  Future<String> getUsername() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(username) ?? "";
  }

  Future<String> getPhone() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(phone) ?? "";
  }

  Future<String> getIdUser() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(idUser) ?? "";
  }

  Future<String> getAvatar() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(avatar) ?? "";
  }

  Future<String> getSign() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(sign) ?? "";
  }

  Future<String> getCashier() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(cashier) ?? "";
  }

  Future<String> getEdc() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(edc) ?? "";
  }

  Future<String> getStruk() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(struk) ?? "";
  }

  Future<String> getBrizzi() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(brizzi) ?? "";
  }

  Future<String> getQris() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(qris) ?? "";
  }

  Future<String> getOptional() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(optional) ?? "";
  }

  Future<String> getOptional2() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(optional2) ?? "";
  }

  Future<int> getWork() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(work) ?? 15;
  }

  Future<int> getHb() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(hb) ?? 0;
  }

  Future<int> getLkm() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(lkm) ?? 0;
  }

  Future<int> getNotif() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(notif) ?? 0;
  }

  Future<bool> getLoginIntro() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(loginIntro) ?? false;
  }

  Future<bool> getHomeIntro() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(homeIntro) ?? false;
  }

  Future<bool> getTicketIntro() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(ticketIntro) ?? false;
  }

  Future<bool> getStockInventoryIntro() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(stockInventoryIntro) ?? false;
  }

  Future<bool> getStockHistoryIntro() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(stockHistoryIntro) ?? false;
  }

  Future<bool> getStockDetailIntro() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(stockDetailIntro) ?? false;
  }

  Future<bool> getSummaryStatisticIntro() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(summaryStatisticIntro) ?? false;
  }

  Future<bool> getSummaryHistoryIntro() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(summaryHistoryIntro) ?? false;
  }

  Future<bool> getCourseIntro() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(courseIntro) ?? false;
  }

  Future<bool> getModulIntro() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(modulIntro) ?? false;
  }

  Future<bool> getMerchantIntro() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(merchantIntro) ?? false;
  }

  Future<bool> getLkmPendingIntro() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(lkmPendingIntro) ?? false;
  }

  Future<bool> getLkmDoneIntro() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(lkmDoneIntro) ?? false;
  }

  Future<bool> getEvidenceIntro() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(evidenceIntro) ?? false;
  }

  Future<bool> getSignatureIntro() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(signatureIntro) ?? false;
  }

  Future<bool> getProfileIntro() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(profileIntro) ?? false;
  }

  // **************** Clear Method Only **************** //

  Future<void> clearSession() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(token);
    await sharedPreferences.remove(verifyToken);
    await sharedPreferences.remove(check);
    await sharedPreferences.remove(username);
    await sharedPreferences.remove(phone);
    await sharedPreferences.remove(idUser);
    await sharedPreferences.remove(avatar);
    await sharedPreferences.remove(connection);

    await sharedPreferences.remove(sign);
    await sharedPreferences.remove(cashier);
    await sharedPreferences.remove(edc);
    await sharedPreferences.remove(struk);
    await sharedPreferences.remove(brizzi);
    await sharedPreferences.remove(qris);
    await sharedPreferences.remove(optional);
    await sharedPreferences.remove(optional2);

    await sharedPreferences.remove(work);
    await sharedPreferences.remove(hb);
    await sharedPreferences.remove(lkm);
    await sharedPreferences.remove(notif);
  }

  Future<void> clearImage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(sign);
    await sharedPreferences.remove(cashier);
    await sharedPreferences.remove(edc);
    await sharedPreferences.remove(struk);
    await sharedPreferences.remove(brizzi);
    await sharedPreferences.remove(qris);
    await sharedPreferences.remove(optional);
    await sharedPreferences.remove(optional2);
  }
}
