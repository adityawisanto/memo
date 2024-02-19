import 'package:memo/packages/packages.dart';

class HomeTicketDone extends StatelessWidget {
  final int totalTicket;

  const HomeTicketDone({
    super.key,
    required this.totalTicket,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 60,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "$totalTicket tiket telah kamu kerjakan hari ini",
                    style: CustomTextStyle.bold(
                      12.sp,
                      color: CustomColorStyle.orangePrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Selamat beristirahat!",
                    style: CustomTextStyle.medium(
                      12.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -8,
            right: -8,
            child: GestureDetector(
              onTap: () => CustomNavigation.back(context),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomColorStyle.white,
                ),
                child: Icon(
                  Icons.close,
                  color: CustomColorStyle.grayPrimary,
                ),
              ),
            ),
          ),
          Positioned(
            top: -150,
            left: 80,
            right: 80,
            bottom: -40,
            child: SvgPicture.asset(
              "assets/images/home/checkout.svg",
            ),
          ),
        ],
      ),
    );
  }
}
