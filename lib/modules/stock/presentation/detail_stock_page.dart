import 'package:memo/packages/packages.dart';

class DetailStockPage extends StatefulWidget {
  static const routeName = "/detail_stock";

  final InventoryArgument inventoryArgument;

  const DetailStockPage({
    super.key,
    required this.inventoryArgument,
  });

  @override
  State<DetailStockPage> createState() => _DetailStockPageState();
}

class _DetailStockPageState extends State<DetailStockPage> {
  final inventoryBloc = locator<InventoryBloc>();
  final customPreferences = locator<CustomPreferences>();

  final List<GlobalKey> keyIntroduction = [
    GlobalKey(),
    GlobalKey(),
  ];

  @override
  void dispose() {
    inventoryBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    inventoryBloc.add(
      InventoryGetted(
        url: widget.inventoryArgument.dataWarehouse.type,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withoutPopScope(
        "STOCK DETAIL",
        centerTitle: false,
        colorText: CustomColorStyle.white,
        colorIcon: CustomColorStyle.white,
        backgroundColor: CustomColorStyle.redPrimary,
        withDate: true,
        onTap: () => CustomNavigation.back(context),
      ),
      body: BlocBuilder(
        bloc: inventoryBloc,
        builder: (context, state) {
          if (state is InventoryLoading) {
            return const DetailStockShimmer();
          } else if (state is InventoryGetSuccess) {
            checkIntroStockDetail(
              keyIntroduction,
              context,
              customPreferences,
            );
            String isEdc =
                widget.inventoryArgument.dataWarehouse.type.toString();
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
                    key: keyIntroduction[0],
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
                        child: widget.inventoryArgument.dataWarehouse.type ==
                                "EDC P1"
                            ? Image.asset(
                                "assets/images/warehouse/edc_p1.png",
                                width: 50.w,
                                height: 50.h,
                              )
                            : widget.inventoryArgument.dataWarehouse.type ==
                                    "EDC P2"
                                ? Image.asset(
                                    "assets/images/warehouse/edc_p2.png",
                                    width: 50.w,
                                    height: 50.h,
                                  )
                                : widget.inventoryArgument.dataWarehouse.type ==
                                        "Kabel USB"
                                    ? SvgPicture.asset(
                                        "assets/images/warehouse/cable.svg",
                                        width: 50.w,
                                        height: 50.h,
                                      )
                                    : widget.inventoryArgument.dataWarehouse
                                                .type ==
                                            "Adaptor"
                                        ? SvgPicture.asset(
                                            "assets/images/warehouse/adaptor.svg",
                                            width: 50.w,
                                            height: 50.h,
                                          )
                                        : widget.inventoryArgument.dataWarehouse
                                                    .type ==
                                                "Thermal paper"
                                            ? SvgPicture.asset(
                                                "assets/images/warehouse/thermal.svg",
                                                width: 50.w,
                                                height: 50.h,
                                              )
                                            : widget.inventoryArgument
                                                        .dataWarehouse.type ==
                                                    "Manual Book"
                                                ? SvgPicture.asset(
                                                    "assets/images/warehouse/book.svg",
                                                    width: 50.w,
                                                    height: 50.h,
                                                  )
                                                : widget
                                                            .inventoryArgument
                                                            .dataWarehouse
                                                            .type ==
                                                        "Rak Besi"
                                                    ? SvgPicture.asset(
                                                        "assets/images/warehouse/rack.svg",
                                                        width: 50.w,
                                                        height: 50.h,
                                                      )
                                                    : widget
                                                                .inventoryArgument
                                                                .dataWarehouse
                                                                .type ==
                                                            "Stiker EDC"
                                                        ? SvgPicture.asset(
                                                            "assets/images/warehouse/sticker.svg",
                                                            width: 50.w,
                                                            height: 50.h,
                                                          )
                                                        : const SizedBox
                                                            .shrink(),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Stok",
                              style: CustomTextStyle.medium(
                                12.sp,
                                color: CustomColorStyle.white,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      state.inventory.data!.length < 10
                                          ? "0${state.inventory.data!.length}"
                                          : state.inventory.data!.length
                                              .toString(),
                                      style: CustomTextStyle.bold(
                                        30.sp,
                                        color: CustomColorStyle.white,
                                      ),
                                    ),
                                    Text(
                                      widget
                                          .inventoryArgument.dataWarehouse.type
                                          .toString(),
                                      style: CustomTextStyle.bold(
                                        12.sp,
                                        color: CustomColorStyle.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                isEdc == "EDC P1" || isEdc == "EDC P2"
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.inventory.data!
                                                        .where(
                                                          (e) =>
                                                              e.status ==
                                                              "pull",
                                                        )
                                                        .length <
                                                    10
                                                ? "0${state.inventory.data!.where(
                                                      (e) => e.status == "pull",
                                                    ).length}"
                                                : state.inventory.data!
                                                    .where(
                                                      (e) => e.status == "pull",
                                                    )
                                                    .length
                                                    .toString(),
                                            style: CustomTextStyle.bold(
                                              12.sp,
                                              color: CustomColorStyle.white,
                                            ),
                                          ),
                                          Text(
                                            "Penarikan",
                                            style: CustomTextStyle.regular(
                                              10.sp,
                                              color: CustomColorStyle.white,
                                            ),
                                          ),
                                          Text(
                                            state.inventory.data!
                                                        .where((e) =>
                                                            e.status == "ready")
                                                        .length <
                                                    10
                                                ? "0${state.inventory.data!.where(
                                                      (e) =>
                                                          e.status == "ready",
                                                    ).length}"
                                                : state.inventory.data!
                                                    .where((e) =>
                                                        e.status == "ready")
                                                    .length
                                                    .toString(),
                                            style: CustomTextStyle.bold(
                                              12.sp,
                                              color: CustomColorStyle.white,
                                            ),
                                          ),
                                          Text(
                                            "Siap digunakan",
                                            style: CustomTextStyle.regular(
                                              10.sp,
                                              color: CustomColorStyle.white,
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox.shrink(),
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
                  child: state.inventory.data!.isEmpty
                      ? CustomHandler.empty()
                      : CustomCard(
                          elevation: 0,
                          child: Column(
                            children: [
                              DetailStockHeader(
                                key: keyIntroduction[1],
                                isEdc: isEdc,
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
                                  itemCount: state.inventory.data!.length,
                                  itemBuilder: (context, index) {
                                    return DetailStockItem(
                                      isEdc: isEdc,
                                      dataInventory:
                                          state.inventory.data![index],
                                      index: index,
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
          } else if (state is InventoryFailure) {
            CustomToast.failure(
              state.message,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
