import 'package:memo/packages/packages.dart';

class ProfileSallary extends StatelessWidget {
  final SallaryBloc sallaryBloc;

  const ProfileSallary({
    super.key,
    required this.sallaryBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 16,
      ),
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      decoration: BoxDecoration(
        color: CustomColorStyle.redPrimary,
      ),
      child: BlocBuilder(
        bloc: sallaryBloc,
        builder: (context, state) {
          if (state is SallaryLoading) {
            return const ProfileSallaryShimmer();
          } else if (state is SallaryGetSuccess) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/images/profile/wallet.svg",
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        CustomFormatter.idr(
                          state.sallary.data!.total,
                        ),
                        style: CustomTextStyle.bold(
                          14.sp,
                          color: CustomColorStyle.white,
                        ),
                      ),
                      Text(
                        "*Data terupdate per ${CustomDate.formatDate(
                          state.sallary.data!.updatedAt.toString(),
                        )}",
                        style: CustomTextStyle.medium(
                          10.sp,
                          color: CustomColorStyle.white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          } else if (state is SallaryFailure) {
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
