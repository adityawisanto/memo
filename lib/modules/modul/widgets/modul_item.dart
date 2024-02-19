import 'package:memo/packages/packages.dart';

class ModulItem extends StatelessWidget {
  final CourseItem courseItem;
  final AssignBloc assignBloc;

  const ModulItem({
    super.key,
    required this.courseItem,
    required this.assignBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: CustomCard(
        elevation: 0,
        withRipple: true,
        onTap: () {
          if (courseItem.status == "open") {
            assignBloc.add(
              AssignSubmitted(
                idAssign: courseItem.idAssign,
                status: "watching",
              ),
            );
          }
          CustomNavigation.intentWithData(
            context,
            ExamPage.routeName,
            ExamArgument(
              courseItem: courseItem,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(
            16,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        courseItem.thumbnail.toString(),
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
                            color: CustomColorStyle.blackPrimary.withOpacity(
                              0.6,
                            ),
                          ),
                          child: Text(
                            courseItem.duration.toString(),
                            style: CustomTextStyle.medium(
                              8.sp,
                              color: CustomColorStyle.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  courseItem.status == "open"
                      ? Positioned(
                          top: 8,
                          left: -8,
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
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseItem.title.toString(),
                      style: CustomTextStyle.bold(
                        10.sp,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      courseItem.description.toString(),
                      style: CustomTextStyle.medium(
                        8.sp,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                            Text(
                              CustomDate.getFormattedGoesToFrom(
                                DateTime.parse(
                                  courseItem.deadline.toString(),
                                ),
                              ),
                              style: CustomTextStyle.medium(
                                8.sp,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              16,
                            ),
                            color: courseItem.status == "watching"
                                ? CustomColorStyle.orangePrimary
                                : courseItem.status == "post test"
                                    ? CustomColorStyle.bluePrimary
                                    : CustomColorStyle.greenPrimary,
                          ),
                          child: Text(
                            courseItem.status == "watching"
                                ? "Watching"
                                : courseItem.status == "post test"
                                    ? "Post Test"
                                    : "Finish",
                            style: CustomTextStyle.medium(
                              8.sp,
                              color: CustomColorStyle.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
