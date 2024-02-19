import 'package:memo/packages/packages.dart';

class CustomHandler {
  static Widget empty({
    String? type,
    bool? withPadding = true,
  }) {
    return Padding(
      padding: EdgeInsets.all(
        withPadding == true ? 16 : 0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/api/${type == "ticket" ? "ticket_empty.svg" : "all_empty.svg"}",
          ),
          Text(
            "Data Belum Tersedia",
            style: CustomTextStyle.bold(
              14.sp,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "Semua informasi yang dimasukkan akan ditampilkan di sini.",
            style: CustomTextStyle.medium(
              12.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
