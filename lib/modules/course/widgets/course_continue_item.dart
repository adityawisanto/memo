import 'package:memo/packages/packages.dart';

class CourseContinueItem extends StatelessWidget {
  final List<CourseItem> courseItem;
  final String title;

  const CourseContinueItem({
    super.key,
    required this.courseItem,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Text(
            title,
            style: CustomTextStyle.bold(
              12.sp,
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          width: CustomSize.width(context),
          height: CustomSize.height(context) / 8,
          child: ListView.builder(
            itemCount: courseItem.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              left: 16,
            ),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: SizedBox(
                  width: CustomSize.width(context) / 1.3,
                  child: CustomCard(
                    elevation: 6,
                    withRipple: true,
                    onTap: () => CustomNavigation.intentWithData(
                      context,
                      ExamPage.routeName,
                      ExamArgument(
                        courseItem: courseItem[index],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                        16,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                courseItem[index].thumbnail.toString(),
                                width: 80.w,
                              ),
                              Positioned(
                                right: 4,
                                bottom: 4,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2,
                                    horizontal: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      4,
                                    ),
                                    color: CustomColorStyle.blackPrimary
                                        .withOpacity(
                                      0.6,
                                    ),
                                  ),
                                  child: Text(
                                    courseItem[index].duration.toString(),
                                    style: CustomTextStyle.medium(
                                      8.sp,
                                      color: CustomColorStyle.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  courseItem[index].title.toString(),
                                  style: CustomTextStyle.bold(
                                    10.sp,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  courseItem[index].description.toString(),
                                  style: CustomTextStyle.medium(
                                    8.sp,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: CustomColorStyle.redPrimary,
                                      size: 14,
                                    ),
                                    SizedBox(
                                      width: 4.h,
                                    ),
                                    Expanded(
                                      child: Text(
                                        CustomDate.getFormattedGoesToFrom(
                                          DateTime.parse(
                                            courseItem[index]
                                                .deadline
                                                .toString(),
                                          ),
                                        ),
                                        style: CustomTextStyle.medium(
                                          8.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }
}
