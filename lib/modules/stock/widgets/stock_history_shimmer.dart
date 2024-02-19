import 'package:memo/packages/packages.dart';

class StockHistoryShimmer extends StatelessWidget {
  const StockHistoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 16,
          ),
          child: CustomCard(
            elevation: 6,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 8,
                  ),
                  padding: const EdgeInsets.all(
                    16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                    color: CustomColorStyle.orangePrimary,
                  ),
                  child: CustomShimmer(
                    width: CustomSize.width(context),
                    height: 16.h,
                    borderRadius: 8,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomShimmer(
                            width: CustomSize.width(context) / 6,
                            height: 16.h,
                            borderRadius: 8,
                          ),
                          CustomShimmer(
                            width: CustomSize.width(context) / 10,
                            height: 16,
                            borderRadius: 8,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Divider(
                        height: 2.h,
                        color: CustomColorStyle.grayPrimary.withOpacity(
                          0.4,
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        physics: const BouncingScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                            ),
                            child: Row(
                              children: [
                                CustomShimmer(
                                  width: 20.w,
                                  height: 20.h,
                                  withCircle: true,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  "x",
                                  style: CustomTextStyle.regular(
                                    12.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                CustomShimmer(
                                  width: 24.w,
                                  height: 24.h,
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
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
