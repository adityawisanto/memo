import 'package:memo/packages/packages.dart';

class SummaryHistoryShimmer extends StatelessWidget {
  const SummaryHistoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(
              16,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TOTAL TIKET",
                          style: CustomTextStyle.bold(
                            12.sp,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomShimmer(
                          width: CustomSize.width(context) / 16,
                          height: 12.h,
                          borderRadius: 8,
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      width: 2,
                      height: CustomSize.height(context) / 8,
                      color: CustomColorStyle.grayPrimary.withOpacity(
                        0.1,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Installation",
                                    style: CustomTextStyle.bold(
                                      10.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  CustomShimmer(
                                    width: CustomSize.width(context) / 16,
                                    height: 10.h,
                                    borderRadius: 8,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "CM",
                                    style: CustomTextStyle.bold(
                                      10.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  CustomShimmer(
                                    width: CustomSize.width(context) / 16,
                                    height: 10.h,
                                    borderRadius: 8,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dismantel",
                                    style: CustomTextStyle.bold(
                                      10.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  CustomShimmer(
                                    width: CustomSize.width(context) / 16,
                                    height: 10.h,
                                    borderRadius: 8,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "PM",
                                    style: CustomTextStyle.bold(
                                      10.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  CustomShimmer(
                                    width: CustomSize.width(context) / 16,
                                    height: 10.h,
                                    borderRadius: 8,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "SM",
                                    style: CustomTextStyle.bold(
                                      10.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  CustomShimmer(
                                    width: CustomSize.width(context) / 16,
                                    height: 10.h,
                                    borderRadius: 8,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CustomShimmer(
                            width: CustomSize.width(context) / 4,
                            height: 14.h,
                            borderRadius: 8,
                          ),
                          CustomShimmer(
                            width: 128.w,
                            height: 128.h,
                            withCircle: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          CustomShimmer(
                            width: CustomSize.width(context) / 4,
                            height: 14.h,
                            borderRadius: 8,
                          ),
                          CustomShimmer(
                            width: 128.w,
                            height: 128.h,
                            withCircle: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        CustomShimmer(
          width: CustomSize.width(context),
          height: 20.h,
          borderRadius: 8,
        ),
        SizedBox(
          height: 4.h,
        ),
        CustomShimmer(
          width: CustomSize.width(context),
          height: 8.h,
          borderRadius: 8,
        ),
        SizedBox(
          height: 4.h,
        ),
        ListView.builder(
          itemCount: 8,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return CustomCard(
              child: Padding(
                padding: const EdgeInsets.all(
                  16,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomShimmer(
                          width: CustomSize.width(context) / 4,
                          height: 14.h,
                          borderRadius: 8,
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomShimmer(
                                  width: CustomSize.width(context),
                                  height: 14.h,
                                  borderRadius: 8,
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              CustomShimmer(
                                width: 14.w,
                                height: 14.h,
                                borderRadius: 8,
                                withCircle: true,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomShimmer(
                            width: CustomSize.width(context),
                            height: 14.h,
                            borderRadius: 8,
                          ),
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        Expanded(
                          child: CustomShimmer(
                            width: CustomSize.width(context),
                            height: 14.h,
                            borderRadius: 8,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
