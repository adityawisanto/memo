import 'package:memo/packages/packages.dart';

class HomeFloating extends StatelessWidget {
  final bool lock;
  final CheckBloc checkinBloc;
  final CheckBloc checkoutBloc;

  const HomeFloating({
    super.key,
    required this.lock,
    required this.checkinBloc,
    required this.checkoutBloc,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return HomeDialog(
            lock: lock,
            onPressed: () {
              if (lock == true) {
                checkinBloc.add(
                  CheckinSubmitted(),
                );
              } else if (lock == false) {
                checkoutBloc.add(
                  CheckoutSubmitted(),
                );
              }
            },
          );
        },
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          100,
        ),
      ),
      backgroundColor: CustomColorStyle.orangePrimary,
      child: SvgPicture.asset(
        "assets/images/home/${lock == true ? "checkin.svg" : "checkout.svg"}",
        width: 40.w,
        height: 40.h,
      ),
    );
  }
}
