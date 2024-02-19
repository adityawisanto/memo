import 'package:memo/packages/packages.dart';

class SummaryStatisticShimmer extends StatelessWidget {
  const SummaryStatisticShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomShimmer(
          width: CustomSize.width(context),
          height: 24.h,
          borderRadius: 8,
        ),
        SizedBox(
          height: 10.h,
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
        CustomCard(
          child: Padding(
            padding: const EdgeInsets.all(
              16,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/home/ticket_off.svg",
                      width: 14.w,
                      height: 14.h,
                      colorFilter: ColorFilter.mode(
                        CustomColorStyle.orangePrimary,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    CustomShimmer(
                      width: CustomSize.width(context) / 10,
                      height: 12.h,
                      borderRadius: 8,
                    ),
                    const Spacer(),
                    CustomShimmer(
                      width: CustomSize.width(context) / 10,
                      height: 12.h,
                      borderRadius: 8,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Divider(
                  height: 4,
                  color: CustomColorStyle.grayPrimary.withOpacity(
                    0.1,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomShimmer(
                  width: CustomSize.width(context),
                  height: CustomSize.height(context) / 3.4,
                  borderRadius: 8,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
