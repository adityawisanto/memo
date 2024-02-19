import 'package:memo/packages/packages.dart';

class CourseShimmer extends StatelessWidget {
  const CourseShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        16,
      ),
      child: Column(
        children: [
          CustomShimmer(
            width: CustomSize.width(context),
            height: 16,
          ),
          SizedBox(
            height: 8.h,
          ),
          CustomShimmer(
            width: CustomSize.width(context),
            height: 16,
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              Expanded(
                child: CustomShimmer(
                  width: CustomSize.width(context),
                  height: 100,
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: CustomShimmer(
                  width: CustomSize.width(context),
                  height: 100,
                ),
              )
            ],
          ),
          SizedBox(
            height: 16.w,
          ),
          CustomShimmer(
            width: CustomSize.width(context),
            height: 20,
          ),
          ListView.builder(
            padding: const EdgeInsets.only(
              top: 16,
            ),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 7,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: CustomCard(
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    child: Row(
                      children: [
                        const CustomShimmer(
                          width: 60,
                          height: 60,
                          withCircle: true,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomShimmer(
                                width: CustomSize.width(context),
                                height: 12,
                              ),
                              SizedBox(
                                height: 4.w,
                              ),
                              CustomShimmer(
                                width: CustomSize.width(context),
                                height: 10,
                              ),
                              SizedBox(
                                height: 4.w,
                              ),
                              CustomShimmer(
                                width: CustomSize.width(context) / 6,
                                height: 10,
                              ),
                              SizedBox(
                                height: 4.w,
                              ),
                              CustomShimmer(
                                width: CustomSize.width(context),
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
