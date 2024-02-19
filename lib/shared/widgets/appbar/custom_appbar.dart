import 'package:memo/packages/packages.dart';

class CustomAppBar {
  static PreferredSizeWidget withPopScope(
    String title, {
    bool? centerTitle = true,
    bool? automaticallyImplyLeading = true,
    Color? colorText,
    Color? backgroundColor,
    void Function()? onTap,
    Color? colorIcon,
    bool? withDate,
    bool? withRange,
    String? startDate,
    String? endDate,
    bool? withSearch,
  }) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      surfaceTintColor: CustomColorStyle.white,
      title: Text(
        title,
        style: CustomTextStyle.bold(
          14.sp,
          color: colorText ?? CustomColorStyle.blackPrimary,
        ),
      ),
      flexibleSpace: withDate == true
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Updated\n${CustomDate.formatDate(DateTime.now().toString(), format: "dd MMMM yyyy")}\n${CustomDate.formatDate(DateTime.now().toString(), format: "HH:mm:ss")}",
                    style: CustomTextStyle.medium(
                      8.sp,
                      color: CustomColorStyle.white,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            )
          : withRange == true
              ? SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                            onTap: onTap,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  16,
                                ),
                                color: CustomColorStyle.white,
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/summary/calendar.svg",
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Text(
                                    "$startDate - $endDate",
                                    style: CustomTextStyle.medium(
                                      10.sp,
                                      color: CustomColorStyle.orangePrimary,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : withSearch == true
                  ? SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            children: [
                              const Spacer(),
                              GestureDetector(
                                onTap: () => CustomNavigation.intent(
                                  CustomNavigator.navigatorKey.currentContext!,
                                  CourseSearchPage.routeName,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(
                                    4,
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomColorStyle.redPrimary,
                                  ),
                                  child: SvgPicture.asset(
                                    "assets/images/ticket/search.svg",
                                    colorFilter: ColorFilter.mode(
                                      CustomColorStyle.white,
                                      BlendMode.srcIn,
                                    ),
                                    width: 12.w,
                                    height: 12.h,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : null,
      leading: automaticallyImplyLeading == true
          ? PopScope(
              canPop: false,
              onPopInvoked: (didPop) => onTap!(),
              child: GestureDetector(
                onTap: onTap,
                child: Icon(
                  Icons.arrow_back,
                  color: colorIcon ?? CustomColorStyle.blackPrimary,
                  size: 20,
                ),
              ),
            )
          : null,
    );
  }

  static PreferredSizeWidget withoutPopScope(
    String title, {
    bool? centerTitle = true,
    bool? automaticallyImplyLeading = true,
    Color? colorText,
    Color? backgroundColor,
    void Function()? onTap,
    Color? colorIcon,
    bool? withDate,
    bool? withRange,
    String? startDate,
    String? endDate,
    bool? withSearch,
  }) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      surfaceTintColor: CustomColorStyle.white,
      title: Text(
        title,
        style: CustomTextStyle.bold(
          14.sp,
          color: colorText ?? CustomColorStyle.blackPrimary,
        ),
      ),
      flexibleSpace: withDate == true
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Updated\n${CustomDate.formatDate(DateTime.now().toString(), format: "dd MMMM yyyy")}\n${CustomDate.formatDate(DateTime.now().toString(), format: "HH:mm:ss")}",
                    style: CustomTextStyle.medium(
                      8.sp,
                      color: CustomColorStyle.white,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            )
          : withRange == true
              ? SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                            onTap: onTap,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  16,
                                ),
                                color: CustomColorStyle.white,
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/summary/calendar.svg",
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Text(
                                    "$startDate - $endDate",
                                    style: CustomTextStyle.medium(
                                      10.sp,
                                      color: CustomColorStyle.orangePrimary,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : withSearch == true
                  ? SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            children: [
                              const Spacer(),
                              GestureDetector(
                                onTap: () => CustomNavigation.intent(
                                  CustomNavigator.navigatorKey.currentContext!,
                                  CourseSearchPage.routeName,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(
                                    4,
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomColorStyle.redPrimary,
                                  ),
                                  child: SvgPicture.asset(
                                    "assets/images/ticket/search.svg",
                                    colorFilter: ColorFilter.mode(
                                      CustomColorStyle.white,
                                      BlendMode.srcIn,
                                    ),
                                    width: 12.w,
                                    height: 12.h,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : null,
      leading: automaticallyImplyLeading == true
          ? GestureDetector(
              onTap: onTap,
              child: Icon(
                Icons.arrow_back,
                color: colorIcon ?? CustomColorStyle.blackPrimary,
                size: 20,
              ),
            )
          : null,
    );
  }
}
