import 'package:memo/packages/packages.dart';

class GraduationPage extends StatefulWidget {
  static const routeName = "/graduation";

  final GraduationArgument graduationArgument;

  const GraduationPage({
    super.key,
    required this.graduationArgument,
  });

  @override
  State<GraduationPage> createState() => _GraduationPageState();
}

class _GraduationPageState extends State<GraduationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) => CustomNavigation.intentWithClearAllRoutes(
          context,
          HomePage.routeName,
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            16,
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/exam/exam.svg",
                  width: 200.w,
                  height: 200.h,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "${widget.graduationArgument.dataAnswer!.correct}/${widget.graduationArgument.total} Correct",
                  style: CustomTextStyle.medium(
                    12.sp,
                    color: CustomColorStyle.orangePrimary,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Total Score : ${widget.graduationArgument.dataAnswer!.score}",
                  style: CustomTextStyle.medium(
                    12.sp,
                    color: CustomColorStyle.orangePrimary,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomButton(
                  onPressed: () => CustomNavigation.intentWithClearAllRoutes(
                    context,
                    HomePage.routeName,
                  ),
                  label: "Back",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
