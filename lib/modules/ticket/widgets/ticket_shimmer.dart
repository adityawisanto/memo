import 'package:memo/packages/packages.dart';

class TicketShimmer extends StatelessWidget {
  const TicketShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              CustomShimmer(
                width: 30.w,
                height: 28.h,
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: SizedBox(
                  height: CustomSize.height(context) / 24,
                  child: ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 8,
                        ),
                        child: CustomShimmer(
                          width: 100.w,
                          height: 34.h,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return CustomCard(
                  withBorder: true,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomShimmer(
                              width: CustomSize.width(context) / 2,
                              height: 10.h,
                            ),
                            CustomShimmer(
                              width: CustomSize.width(context) / 6,
                              height: 10.h,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomShimmer(
                              width: CustomSize.width(context) / 4,
                              height: 14.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomShimmer(
                                  width: CustomSize.width(context) / 5,
                                  height: 10.h,
                                ),
                                SizedBox(
                                  width: 4.h,
                                ),
                                CustomShimmer(
                                  width: CustomSize.width(context) / 5,
                                  height: 10.h,
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        CustomShimmer(
                          width: CustomSize.width(context) / 5,
                          height: 12.h,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        CustomShimmer(
                          width: CustomSize.width(context),
                          height: 10.h,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Expanded(
                              child: CustomShimmer(
                                width: CustomSize.width(context),
                                height: 14.h,
                                borderRadius: 30,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
