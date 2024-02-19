import 'package:memo/packages/packages.dart';

class CustomIndicator extends StatefulWidget {
  const CustomIndicator({super.key});

  @override
  State<CustomIndicator> createState() => _CustomIndicatorState();
}

class _CustomIndicatorState extends State<CustomIndicator> {
  final customPreferences = locator<CustomPreferences>();

  int? status;

  late Timer timer;

  Future<void> checkedConnection() async {
    await customPreferences.saveConnection(0);

    if (await CustomInternet().checked()) {
      debugPrint("ok internet");
      await customPreferences.saveConnection(1);
      status = 1;
    } else {
      debugPrint("not ok internet");
      await customPreferences.saveConnection(0);
      status = 0;
    }

    final stat = await customPreferences.getConnection();

    setState(() {
      status = stat;
    });
  }

  @override
  void initState() {
    checkedConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12.w,
      height: 12.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: status == 1
            ? CustomColorStyle.greenPrimary
            : CustomColorStyle.redPrimary,
      ),
    );
  }
}
