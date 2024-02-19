import 'package:memo/packages/packages.dart';

class CourseCategoryItem extends StatelessWidget {
  final DataCourse dataCourse;

  const CourseCategoryItem({
    super.key,
    required this.dataCourse,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 4,
      ),
      child: Stack(
        children: [
          CustomCard(
            withRipple: true,
            onTap: () => CustomNavigation.intentWithData(
              context,
              ModulPage.routeName,
              ModulArgument(
                dataCourse: dataCourse,
              ),
            ),
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              child: Row(
                children: [
                  Image.network(
                    dataCourse.image.toString(),
                    width: 50.w,
                    height: 50.h,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          dataCourse.name.toString().toUpperCase(),
                          style: CustomTextStyle.bold(
                            10.sp,
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          dataCourse.description.toString(),
                          style: CustomTextStyle.medium(
                            8.sp,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          "${dataCourse.modul} modul",
                          style: CustomTextStyle.medium(
                            8.sp,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        LinearPercentIndicator(
                          animation: true,
                          lineHeight: 16,
                          padding: EdgeInsets.zero,
                          animationDuration: 1000,
                          percent: dataCourse.percentage!.toDouble() / 100,
                          center: Text(
                            "${dataCourse.percentage!.toDouble()}%",
                            style: CustomTextStyle.medium(
                              8.sp,
                              color: CustomColorStyle.white,
                            ),
                          ),
                          barRadius: const Radius.circular(
                            16,
                          ),
                          progressColor: CustomColorStyle.redPrimary,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          dataCourse.status == "open"
              ? Positioned(
                  top: 16,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.all(
                      8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(
                          30,
                        ),
                        bottomLeft: Radius.circular(
                          30,
                        ),
                        topRight: Radius.circular(
                          50,
                        ),
                        bottomRight: Radius.circular(
                          50,
                        ),
                      ),
                      color: CustomColorStyle.redPrimary,
                    ),
                    child: Text(
                      "New",
                      style: CustomTextStyle.bold(
                        8.sp,
                        color: CustomColorStyle.white,
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
