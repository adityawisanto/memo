import 'package:memo/packages/packages.dart';

class DetailStockShimmer extends StatelessWidget {
  const DetailStockShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(
            16,
          ),
          margin: const EdgeInsets.all(
            16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8,
            ),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                CustomColorStyle.redSecondary,
                CustomColorStyle.redPrimary,
              ],
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(
                  24,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                  color: CustomColorStyle.white,
                ),
                child: CustomShimmer(
                  width: 50.w,
                  height: 50.h,
                  borderRadius: 8,
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomShimmer(
                      width: CustomSize.width(context),
                      height: 12.h,
                      borderRadius: 8,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              CustomShimmer(
                                width: CustomSize.width(context),
                                height: 50.h,
                                borderRadius: 8,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              CustomShimmer(
                                width: CustomSize.width(context),
                                height: 12.h,
                                borderRadius: 8,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomShimmer(
                                width: CustomSize.width(context) / 16,
                                height: 12.h,
                                borderRadius: 8,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              CustomShimmer(
                                width: CustomSize.width(context),
                                height: 12.h,
                                borderRadius: 8,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              CustomShimmer(
                                width: CustomSize.width(context) / 16,
                                height: 12.h,
                                borderRadius: 8,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              CustomShimmer(
                                width: CustomSize.width(context),
                                height: 12.h,
                                borderRadius: 8,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: CustomCard(
            elevation: 0,
            child: Column(
              children: [
                CustomShimmer(
                  width: CustomSize.width(context),
                  height: 26.h,
                  borderRadius: 8,
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  width: CustomSize.width(context),
                  height: CustomSize.height(context) / 1.9,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8,
                        ),
                        child: Row(
                          children: [
                            CustomShimmer(
                              width: 12.w,
                              height: 12.h,
                              withCircle: true,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Expanded(
                              child: CustomShimmer(
                                width: CustomSize.width(context),
                                height: 12.h,
                                borderRadius: 8,
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Expanded(
                              child: CustomShimmer(
                                width: CustomSize.width(context),
                                height: 12.h,
                                borderRadius: 8,
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Expanded(
                              child: CustomShimmer(
                                width: CustomSize.width(context),
                                height: 12.h,
                                borderRadius: 8,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
