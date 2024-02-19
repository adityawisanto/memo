import 'package:intl/intl.dart';

class CustomDate {
  static String formatDate(
    String dateTime, {
    String? format,
  }) {
    return DateFormat(format ?? 'dd MMMM yy, HH:mm:ss').format(
      DateTime.parse(dateTime),
    );
  }

  static String getFormattedDifference(DateTime start, DateTime end) {
    Duration difference = end.difference(start);

    int days = difference.inDays;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;

    if (days > 0) {
      return "$days hari";
    } else if (hours > 0) {
      return "$hours jam";
    } else {
      return "$minutes menit";
    }
  }

  static String getFormattedGoesToFrom(
    DateTime target,
  ) {
    DateTime now = DateTime.now();

    Duration difference = target.difference(now);

    int days = difference.inDays;
    /* int hours = difference.inHours.remainder(24);
    int minutes = difference.inMinutes.remainder(60); */

    if (days < 0) {
      return "$days hari lagi";
    } else {
      return "Sudah lewat $days hari";
    }
  }
}
