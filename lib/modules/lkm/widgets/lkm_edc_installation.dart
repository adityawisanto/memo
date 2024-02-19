import 'package:memo/packages/packages.dart';

class LkmEdcInstallation<T> extends StatelessWidget {
  final String title;
  final String? hint;
  final Warehouse warehouse;
  final int index;
  final WarehouseSn? warehouseSn;
  final void Function(WarehouseSn?)? onChanged;

  const LkmEdcInstallation({
    super.key,
    required this.title,
    this.hint,
    required this.warehouse,
    required this.index,
    required this.warehouseSn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8,
        ),
        color: CustomColorStyle.white,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Image.asset(
            "assets/images/warehouse/${title == "EDC P1" ? "edc_p1.png" : "edc_p2.png"}",
            width: 60.w,
            height: 60.h,
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            title,
            style: CustomTextStyle.bold(
              10.sp,
            ),
          ),
          Text(
            "Stok ${warehouse.data!.where(
                  (e) => e.type == title,
                ).first.total}",
            style: CustomTextStyle.medium(
              10.sp,
              color: CustomColorStyle.grayPrimary,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 16,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                8,
              ),
              color: CustomColorStyle.orangePrimary,
            ),
            child: DropdownButtonFormField<WarehouseSn>(
              isExpanded: true,
              iconDisabledColor: CustomColorStyle.white,
              dropdownColor: CustomColorStyle.white,
              iconEnabledColor: CustomColorStyle.white,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: CustomColorStyle.white,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: CustomColorStyle.white,
                  ),
                ),
              ),
              hint: Text(
                hint ?? "Pilih SN",
                style: CustomTextStyle.medium(
                  10.sp,
                  color: CustomColorStyle.white,
                ),
              ),
              value: warehouseSn,
              items: warehouse.data![index].dataSn!
                  .where(
                    (e) => e.type == title,
                  )
                  .toList()
                  .map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Wrap(
                    children: [
                      Text(
                        value.sn.toString(),
                        style: CustomTextStyle.medium(
                          10.sp,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              selectedItemBuilder: (BuildContext ctxt) {
                return warehouse.data![index].dataSn!
                    .where(
                      (e) => e.type == title,
                    )
                    .toList()
                    .map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Wrap(
                      children: [
                        Text(
                          value.sn.toString(),
                          style: CustomTextStyle.medium(
                            10.sp,
                            color: CustomColorStyle.white,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList();
              },
              onChanged: onChanged,
            ),
          )
        ],
      ),
    );
  }
}
