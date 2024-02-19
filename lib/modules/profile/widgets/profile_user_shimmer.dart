import 'package:memo/packages/packages.dart';

class ProfileUserShimmer extends StatelessWidget {
  const ProfileUserShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 4.h,
        ),
        CustomShimmer(
          width: CustomSize.width(context) / 8,
          height: 16.h,
        ),
        SizedBox(
          height: 10.h,
        ),
        const Center(
          child: CustomShimmer(
            width: 126,
            height: 126,
            withCircle: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              CustomShimmer(
                width: CustomSize.width(context) / 8,
                height: 16.h,
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomShimmer(
                width: CustomSize.width(context) / 4,
                height: 16.h,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomCard(
                child: Padding(
                  padding: const EdgeInsets.all(
                    16,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomShimmer(
                              width: CustomSize.width(context),
                              height: 16.h,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          CustomShimmer(
                            width: CustomSize.width(context) / 30,
                            height: 16.h,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: CustomShimmer(
                              width: CustomSize.width(context),
                              height: 16.h,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomShimmer(
                              width: CustomSize.width(context),
                              height: 16.h,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          CustomShimmer(
                            width: CustomSize.width(context) / 30,
                            height: 16.h,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: CustomShimmer(
                              width: CustomSize.width(context),
                              height: 16.h,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomShimmer(
                              width: CustomSize.width(context),
                              height: 16.h,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          CustomShimmer(
                            width: CustomSize.width(context) / 30,
                            height: 16.h,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: CustomShimmer(
                              width: CustomSize.width(context),
                              height: 16.h,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomShimmer(
                              width: CustomSize.width(context),
                              height: 16.h,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          CustomShimmer(
                            width: CustomSize.width(context) / 30,
                            height: 16.h,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: CustomShimmer(
                              width: CustomSize.width(context),
                              height: 16.h,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Divider(
                        height: 1,
                        color: CustomColorStyle.grayPrimary.withOpacity(
                          0.2,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomShimmer(
                              width: CustomSize.width(context),
                              height: 16.h,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          CustomShimmer(
                            width: CustomSize.width(context) / 30,
                            height: 16.h,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: CustomShimmer(
                              width: CustomSize.width(context),
                              height: 16.h,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomShimmer(
                              width: CustomSize.width(context),
                              height: 16.h,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          CustomShimmer(
                            width: CustomSize.width(context) / 30,
                            height: 16.h,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: CustomShimmer(
                              width: CustomSize.width(context),
                              height: 16.h,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomShimmer(
                              width: CustomSize.width(context),
                              height: 16.h,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          CustomShimmer(
                            width: CustomSize.width(context) / 30,
                            height: 16.h,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: CustomShimmer(
                              width: CustomSize.width(context),
                              height: 16.h,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomShimmer(
                              width: CustomSize.width(context),
                              height: 16.h,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          CustomShimmer(
                            width: CustomSize.width(context) / 30,
                            height: 16.h,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: CustomShimmer(
                              width: CustomSize.width(context),
                              height: 16.h,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomShimmer(
                width: CustomSize.width(context) / 4,
                height: 16.h,
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomShimmer(
                width: CustomSize.width(context) / 4,
                height: 16.h,
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomShimmer(
                width: CustomSize.width(context) / 8,
                height: 16.h,
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomShimmer(
                width: CustomSize.width(context),
                height: 34.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
