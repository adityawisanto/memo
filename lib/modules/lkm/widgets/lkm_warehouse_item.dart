import 'package:memo/packages/packages.dart';

class LkmWarehouseItem extends StatelessWidget {
  final DataWarehouse dataWarehouse;
  final LkmArgument lkmArgument;
  final TextEditingController controller;
  final GestureTapCallback? onTapRemove;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTapAdd;

  const LkmWarehouseItem({
    super.key,
    required this.dataWarehouse,
    required this.lkmArgument,
    required this.controller,
    required this.onTapRemove,
    required this.onChanged,
    required this.onTapAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            margin: const EdgeInsets.all(
              6,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                8,
              ),
              color: CustomColorStyle.white,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  MasterJsonWarehouse()
                      .typeWithImage(dataWarehouse.type)
                      .toString(),
                  width: 20.w,
                  height: 20.h,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dataWarehouse.type.toString(),
                        style: CustomTextStyle.medium(
                          10.sp,
                        ),
                      ),
                      dataWarehouse.type == "Thermal paper"
                          ? Text(
                              "Rekomendasi : ${lkmArgument.dataTicket!.thermal.toString()}",
                              style: CustomTextStyle.medium(
                                10.sp,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
                Text(
                  "Stok : ${dataWarehouse.total.toString()}",
                  style: CustomTextStyle.medium(
                    10.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 24.w,
        ),
        Expanded(
          child: Row(
            children: [
              GestureDetector(
                onTap: onTapRemove,
                child: const Icon(
                  Icons.remove,
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  textCapitalization: TextCapitalization.characters,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  cursorColor: CustomColorStyle.orangePrimary,
                  decoration: InputDecoration(
                    hintText: dataWarehouse.type.toString(),
                    hintStyle: CustomTextStyle.medium(
                      10.sp,
                      color: CustomColorStyle.grayPrimary.withOpacity(
                        0.2,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        16,
                      ),
                      borderSide: BorderSide(
                        color: CustomColorStyle.orangePrimary,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        16,
                      ),
                      borderSide: BorderSide(
                        color: CustomColorStyle.orangePrimary,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                  ),
                  style: CustomTextStyle.medium(
                    10.sp,
                  ),
                  onChanged: onChanged,
                ),
              ),
              GestureDetector(
                onTap: onTapAdd,
                child: const Icon(
                  Icons.add,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
