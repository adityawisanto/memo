import 'package:memo/packages/packages.dart';

class LoginDialog extends StatefulWidget {
  const LoginDialog({
    super.key,
  });

  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  final noHp = TextEditingController();

  final userBloc = locator<UserBloc>();
  final customPreferences = locator<CustomPreferences>();

  String verifyPhone = "";

  @override
  void dispose() {
    userBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    userBloc.add(
      UserGetted(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: userBloc,
      builder: (context, state) {
        if (state is UserLoading) {
          debugPrint("loading");
        } else if (state is UserGetSuccess) {
          verifyPhone = state.user.data!.phone.toString().substring(
                state.user.data!.phone!.length - 4,
              );
          return Dialog(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(
                16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Verifikasi",
                    style: CustomTextStyle.bold(
                      12.sp,
                      color: CustomColorStyle.orangePrimary,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "Silahkan masukkan 4 digit terakhir dari No HP anda yang terdaftar pada admin",
                    style: CustomTextStyle.regular(
                      10.sp,
                      color: CustomColorStyle.grayPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  TextFormField(
                    controller: noHp,
                    textAlign: TextAlign.center,
                    textCapitalization: TextCapitalization.characters,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    cursorColor: CustomColorStyle.orangePrimary,
                    decoration: InputDecoration(
                      hintText: "No HP",
                      hintStyle: CustomTextStyle.medium(
                        10.sp,
                        color: CustomColorStyle.grayPrimary.withOpacity(
                          0.2,
                        ),
                      ),
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                        borderSide: BorderSide(
                          width: 1,
                          color: CustomColorStyle.orangePrimary,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                        borderSide: BorderSide(
                          color: CustomColorStyle.orangePrimary,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                        borderSide: BorderSide(
                          color: CustomColorStyle.orangePrimary,
                        ),
                      ),
                      errorStyle: CustomTextStyle.medium(
                        10.sp,
                        color: CustomColorStyle.white,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                    ),
                    style: CustomTextStyle.medium(
                      10.sp,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () => {
                        if (noHp.text.isEmpty)
                          {
                            CustomToast.failure(
                              "No Hp tidak boleh kosong",
                            )
                          }
                        else if (noHp.text == verifyPhone)
                          {
                            customPreferences.saveVerifyToken(
                              "verify",
                            ),
                            CustomNavigation.intentWithClearAllRoutes(
                              context,
                              HomePage.routeName,
                            ),
                          }
                        else
                          {
                            CustomNavigation.back(context),
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const LoginDialogNoHp();
                              },
                            ),
                          }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColorStyle.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                        foregroundColor: CustomColorStyle.orangePrimary,
                      ),
                      child: Text(
                        "OK",
                        style: CustomTextStyle.medium(
                          10.sp,
                          color: CustomColorStyle.orangePrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is UserFailure) {
          CustomNavigation.back(context);
          CustomToast.failure(
            state.message,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
