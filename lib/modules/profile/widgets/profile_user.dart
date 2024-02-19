import 'package:memo/packages/packages.dart';

class ProfileUser extends StatelessWidget {
  final UserBloc userBloc;
  final List<GlobalKey> keyIntroduction;
  final CustomPreferences customPreferences;
  final void Function()? onTapCamera;
  final void Function()? onTapGallery;
  final String device;
  final String versioning;
  final bool loading;

  const ProfileUser({
    super.key,
    required this.userBloc,
    required this.keyIntroduction,
    required this.customPreferences,
    required this.onTapCamera,
    required this.onTapGallery,
    required this.device,
    required this.versioning,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: userBloc,
      builder: (context, state) {
        if (state is UserLoading) {
          return const ProfileUserShimmer();
        } else if (state is UserGetSuccess) {
          checkIntroProfile(
            keyIntroduction,
            context,
            customPreferences,
          );
          return Column(
            children: [
              Text(
                state.user.data!.name.toString(),
                style: CustomTextStyle.bold(
                  14.sp,
                  color: CustomColorStyle.orangePrimary,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    state.user.data!.avatar == null ||
                            state.user.data!.avatar == ""
                        ? Image.asset(
                            "assets/images/profile/avatar.png",
                            width: 130.w,
                            height: 130.h,
                          )
                        : CircleAvatar(
                            backgroundImage: NetworkImage(
                              state.user.data!.avatar.toString(),
                            ),
                            radius: 60,
                          ),
                    Positioned(
                      key: keyIntroduction[0],
                      right: state.user.data!.avatar == null ? 8 : -4,
                      bottom: state.user.data!.avatar == null ? 8 : -4,
                      child: GestureDetector(
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => ProfileDialog(
                            onTapCamera: onTapCamera,
                            onTapGallery: onTapGallery,
                          ),
                        ),
                        child: Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: CustomColorStyle.white,
                            ),
                            color: CustomColorStyle.grayPrimary,
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: CustomColorStyle.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "@${state.user.data!.name}",
                style: CustomTextStyle.bold(
                  14.sp,
                  color: CustomColorStyle.orangePrimary,
                ),
              ),
              Text(
                state.user.data!.phone.toString(),
                style: CustomTextStyle.regular(
                  12.sp,
                ),
              ),
              ProfileTable(
                dataUser: state.user.data!,
                device: device.toString(),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Powered by",
                    style: CustomTextStyle.bold(
                      8.sp,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  SvgPicture.asset(
                    "assets/images/profile/pcs_payment.svg",
                    width: 12.w,
                    height: 12.h,
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "App Version",
                style: CustomTextStyle.medium(
                  12.sp,
                ),
              ),
              Text(
                versioning.toString(),
                style: CustomTextStyle.bold(
                  12.sp,
                  color: CustomColorStyle.orangePrimary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  20,
                ),
                child: loading == true
                    ? SizedBox(
                        width: 20.w,
                        height: 20.h,
                        child: CircularProgressIndicator(
                          color: CustomColorStyle.orangePrimary,
                          strokeWidth: 2.4,
                        ),
                      )
                    : CustomButton(
                        key: keyIntroduction[1],
                        onPressed: () => CustomDialog().information(
                          "Logout",
                          "Yakin kamu akan pergi ): ?",
                          no: "Tidak",
                          negative: () => CustomNavigation.back(context),
                          yes: "Ya",
                          positive: () async => await customPreferences
                              .clearSession()
                              .then(
                                (value) =>
                                    CustomNavigation.intentWithClearAllRoutes(
                                  context,
                                  LoginPage.routeName,
                                ),
                              ),
                          backgroundPositive: CustomColorStyle.white,
                          colorTextPositive: CustomColorStyle.orangePrimary,
                          reverse: true,
                        ),
                        label: "Logout",
                      ),
              ),
            ],
          );
        } else if (state is UserFailure) {
          CustomToast.failure(
            state.message,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
