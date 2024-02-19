import 'package:intl/intl.dart';
import 'package:memo/packages/packages.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    init();
    switch (taskName) {
      case "heartbreak":
        final sharedPreferences = await SharedPreferences.getInstance();
        final hb = sharedPreferences.getInt("hb") ?? 4;
        final hbParam = sharedPreferences.getInt("param_hb") ?? 0;
        sharedPreferences.setInt("param_hb", hbParam + 1);

        final checked = sharedPreferences.getBool("Check");

        if (checked == false) {
          if (hbParam >= hb) {
            sharedPreferences.remove("param_hb");
            final response = await Dio().post(
              "${CustomEnv().env("BASE_URL")}${CustomEnv().env("HEART_BEAT")}",
              data: {
                "longitude": await CustomGeolocation().longitude(),
                "latitude": await CustomGeolocation().latitude(),
              },
              options: Options(
                headers: {
                  "Content-Type": "application/json",
                  "Authorization":
                      "Bearer ${sharedPreferences.getString("Token") ?? ""}"
                },
              ),
            );

            debugPrint(
                "----------------------------------------Heart Break : ${response.data}----------------------------------------");
          }
        }

        break;
      case "LKM":
        final sharedPreferences = await SharedPreferences.getInstance();
        final lkm = sharedPreferences.getInt("lkm") ?? 1;
        final lkmParam = sharedPreferences.getInt("param_lkm") ?? 0;
        sharedPreferences.setInt("param_lkm", lkmParam + 1);

        final checked = sharedPreferences.getBool("Check");

        if (checked == false) {
          if (lkmParam >= lkm) {
            final getLkm = await LkmTable().getLkm();
            final data = getLkm.data!;

            final response = await Dio().post(
              "${CustomEnv().env("BASE_URL")}${CustomEnv().env("LKM")}",
              data: {
                "id_ticket": data.idTicket,
                "no_ticket": data.noTicket,
                "no_lkm": data.noLkm,
                "checklist": {
                  "purchase": data.purchase == "null"
                      ? {}
                      : json.decode(data.purchase.toString()),
                  "brizzi": data.brizzi == "null"
                      ? {}
                      : json.decode(data.brizzi.toString()),
                  "qris": data.qris == "null"
                      ? {}
                      : json.decode(data.qris.toString()),
                  "help": data.help == "null"
                      ? {}
                      : json.decode(data.help.toString()),
                  "aktivitas": data.activity == "null"
                      ? {}
                      : json.decode(data.activity.toString()),
                  "note": data.note == "null"
                      ? {}
                      : json.decode(data.note.toString()),
                  "tambahan": {
                    "list_edc_lain": data.anotherListEdc,
                    "tipe_merchant": data.merchantType,
                    "edc_utama": data.edcPrimary,
                    "keterangan": data.description,
                  }
                },
                "EDC": data.edc,
                "EDC_penarikan": data.edcWithdrawal,
                "item":
                    data.item == "{}" ? {} : json.decode(data.item.toString()),
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
                  "merchant": data.merchantImg,
                  "cashier": data.cashierImg,
                  "edc": data.edcImg,
                  "receipt_purchase": data.purchaseImg,
                  "receipt_brizzi": data.brizziImg,
                  "receipt_qris": data.qrisImg,
                  "receipt_optional": data.optionalImg,
                  "receipt_optional2": data.optional2Img,
                },
                "ttd": {
                  "merchant_name": data.merchantName,
                  "merchant_number": data.merchantNumber,
                  "merchant_sign": data.merchantSign,
                  "officer_name": data.officerName,
                  "officer_number": data.officerNumber,
                  "officer_sign": data.officerSign,
                },
                "idStatus": data.idStatus,
                "idStatusDetail": data.idStatusDetail,
                "status_ticket": data.statusTicket,
                "merchant_open_time": data.merchantOpenTime,
                "merchant_close_time": data.merchantCloseTime,
                "merchant_address": data.merchantAddress,
              },
              options: Options(
                headers: {
                  "Content-Type": "application/json",
                  "Authorization":
                      "Bearer ${sharedPreferences.getString("Token") ?? ""}"
                },
              ),
            );

            if (response.statusCode == 202 ||
                response.statusCode == 200 ||
                response.statusCode == 201) {
              await LkmTable().deleteLkm(
                data.idTicket.toString(),
              );
            }
            debugPrint(
                "----------------------------------------LKM : ${response.data}----------------------------------------");
          }
        }

        break;
      case "check":
        DateTime now = DateTime.now();

        DateTime midnightDateTime = DateTime(
          now.year,
          now.month,
          now.day,
        );

        String startDate = DateFormat("HH:mm").format(now);
        String endDate = DateFormat("HH:mm").format(midnightDateTime);

        if (startDate == endDate) {
          final sharedPreferences = await SharedPreferences.getInstance();
          await sharedPreferences.setBool("Check", true);
          final response = await Dio().post(
            "${CustomEnv().env("BASE_URL")}${CustomEnv().env("CHECKOUT")}",
            options: Options(
              headers: {
                "Content-Type": "application/json",
                "Authorization":
                    "Bearer ${sharedPreferences.getString("Token") ?? ""}"
              },
            ),
          );

          debugPrint(
              "----------------------------------------Check : ${response.data}----------------------------------------");
        }
        break;
      case "notification":
        final sharedPreferences = await SharedPreferences.getInstance();
        final notif = sharedPreferences.getInt("notif") ?? 1;
        final notifParam = sharedPreferences.getInt("param_notif") ?? 0;
        sharedPreferences.setInt("param_notif", notifParam + 1);

        final checked = sharedPreferences.getBool("Check");

        if (checked == false) {
          if (notifParam >= notif) {
            sharedPreferences.remove("param_notif");
            final response = await Dio().get(
              "${CustomEnv().env("BASE_URL")}${CustomEnv().env("ALMOST")}",
              options: Options(
                headers: {
                  "Content-Type": "application/json",
                  "Authorization":
                      "Bearer ${sharedPreferences.getString("Token") ?? ""}"
                },
              ),
            );

            final data = response.data["count"];

            if (data > 0) {
              CustomNotification.createAndDisplayNotification(
                "ㅠㅠ Terdapat $data tiket yang mendekati OUT SLA ㅠㅠ",
                "Klik untuk melihat tiket",
              );
            }

            debugPrint(
                "----------------------------------------Notification : ${response.data}----------------------------------------");
          }
        }

        break;
    }
    return Future.value(true);
  });
}

class CustomWork {
  static init() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    int work = sharedPreferences.getInt("work") ?? 15;

    DateTime now = DateTime.now();
    DateTime midnight = DateTime(now.year, now.month, now.day, 23, 59, 59);
    Duration durationUntilMidnight = midnight.difference(now);

    Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: false,
    );

    await Workmanager().registerPeriodicTask(
      "heartbreak",
      "heartbreak",
      initialDelay: Duration(
        seconds: work,
      ),
      frequency: Duration(
        seconds: work,
      ),
    );

    await Workmanager().registerPeriodicTask(
      "notification",
      "notification",
      initialDelay: Duration(
        seconds: work,
      ),
      frequency: Duration(
        seconds: work,
      ),
    );

    await Workmanager().registerOneOffTask(
      "check",
      "check",
      initialDelay: durationUntilMidnight,
    );

    await Workmanager().registerPeriodicTask(
      "LKM",
      "LKM",
      initialDelay: Duration(
        seconds: work,
      ),
      frequency: Duration(
        seconds: work,
      ),
    );
  }
}
