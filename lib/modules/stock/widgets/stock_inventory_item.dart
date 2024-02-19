import 'package:memo/packages/packages.dart';

class StockInventoryItem extends StatelessWidget {
  final DataWarehouse dataWarehouse;

  const StockInventoryItem({
    super.key,
    required this.dataWarehouse,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      elevation: 6,
      child: InkWell(
        onTap: () => CustomNavigation.intentWithData(
          context,
          DetailStockPage.routeName,
          InventoryArgument(
            dataWarehouse: dataWarehouse,
          ),
        ),
        borderRadius: BorderRadius.circular(
          8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            dataWarehouse.type == "EDC P1"
                ? Image.asset(
                    "assets/images/warehouse/edc_p1.png",
                    width: 40.w,
                    height: 40.h,
                  )
                : dataWarehouse.type == "EDC P2"
                    ? Image.asset(
                        "assets/images/warehouse/edc_p2.png",
                        width: 40.w,
                        height: 40.h,
                      )
                    : dataWarehouse.type == "Kabel USB"
                        ? SvgPicture.asset(
                            "assets/images/warehouse/cable.svg",
                            width: 40.w,
                            height: 40.h,
                          )
                        : dataWarehouse.type == "Adaptor"
                            ? SvgPicture.asset(
                                "assets/images/warehouse/adaptor.svg",
                                width: 40.w,
                                height: 40.h,
                              )
                            : dataWarehouse.type == "Thermal paper"
                                ? SvgPicture.asset(
                                    "assets/images/warehouse/thermal.svg",
                                    width: 40.w,
                                    height: 40.h,
                                  )
                                : dataWarehouse.type == "Manual Book"
                                    ? SvgPicture.asset(
                                        "assets/images/warehouse/book.svg",
                                        width: 40.w,
                                        height: 40.h,
                                      )
                                    : dataWarehouse.type == "Rak Besi"
                                        ? SvgPicture.asset(
                                            "assets/images/warehouse/rack.svg",
                                            width: 40.w,
                                            height: 40.h,
                                          )
                                        : dataWarehouse.type == "Stiker EDC"
                                            ? SvgPicture.asset(
                                                "assets/images/warehouse/sticker.svg",
                                                width: 40.w,
                                                height: 40.h,
                                              )
                                            : const SizedBox.shrink(),
            SizedBox(
              height: 4.h,
            ),
            Text(
              dataWarehouse.type.toString(),
              style: CustomTextStyle.bold(
                10.sp,
              ),
            ),
            Text(
              dataWarehouse.total.toString(),
              style: CustomTextStyle.medium(
                10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
