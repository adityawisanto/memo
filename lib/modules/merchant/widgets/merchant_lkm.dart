import 'package:memo/packages/packages.dart';

class MerchantLkm extends StatelessWidget {
  final MerchantArgument merchantArgument;
  final MasterDropdownTicketStatus? status;
  final DataStatus? dataStatus;
  final MasterDropdownEdc? edcPrimary;
  final MasterDropdownReason? reasonA;
  final MasterDropdownReason? reasonB;

  const MerchantLkm({
    super.key,
    required this.merchantArgument,
    required this.status,
    required this.dataStatus,
    required this.edcPrimary,
    required this.reasonA,
    required this.reasonB,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      withRipple: true,
      onTap: () => CustomNavigation.intentWithClearAllRoutes(
        context,
        status!.title == "Pending"
            ? LkmPendingPage.routeName
            : status!.title == "Done"
                ? LkmDonePage.routeName
                : "nothing",
        arguments: LkmArgument(
          dataTicket: merchantArgument.dataTicket,
          status: status,
          dataStatus: dataStatus,
          edcPrimary: edcPrimary,
          reasonA: reasonA,
          reasonB: reasonB,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: SizedBox(
          width: CustomSize.width(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/merchant/lkm.png",
                  width: 100.w,
                  height: 100.h,
                ),
              ),
              Text(
                "Isi LKM",
                style: CustomTextStyle.bold(
                  10.sp,
                  color: CustomColorStyle.orangePrimary,
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "Isilah LKM dengan benar",
                style: CustomTextStyle.medium(
                  10.sp,
                  color: CustomColorStyle.grayPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
