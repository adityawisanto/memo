import 'package:memo/packages/packages.dart';

class LoginForm extends StatelessWidget {
  final List<GlobalKey> keyIntoduction;
  final TextEditingController username;
  final TextEditingController password;
  final TextEditingController chapta;
  final bool chaperr;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final VoidCallback onPressed;
  final bool visiblePassword;
  final int chaptaPrimary;
  final int chaptaSecondary;
  final VoidCallback? onLogin;

  const LoginForm({
    super.key,
    required this.keyIntoduction,
    required this.username,
    required this.password,
    required this.chapta,
    required this.chaperr,
    required this.onChanged,
    required this.obscureText,
    required this.onPressed,
    required this.visiblePassword,
    required this.chaptaPrimary,
    required this.chaptaSecondary,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          key: keyIntoduction[0],
          controller: username,
          style: CustomTextStyle.medium(
            12.sp,
            color: CustomColorStyle.white,
          ),
          cursorColor: CustomColorStyle.white,
          textInputAction: TextInputAction.done,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => CustomValidation.empty("Username", value!),
          inputFormatters: [
            FilteringTextInputFormatter.deny(
              RegExp(
                r'\s',
              ),
            ),
          ],
          decoration: CustomFieldStyle.login(
            context,
            "Username",
            "assets/images/login/username.svg",
          ),
        ),
        TextFormField(
          key: keyIntoduction[1],
          controller: password,
          style: CustomTextStyle.medium(
            12.sp,
            color: CustomColorStyle.white,
          ),
          cursorColor: CustomColorStyle.white,
          textInputAction: TextInputAction.done,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => CustomValidation.empty("Password", value!),
          obscureText: obscureText,
          decoration: CustomFieldStyle.login(
            context,
            "Password",
            "assets/images/login/password.svg",
            passwordMode: true,
            onPressed: onPressed,
            visiblePassword: visiblePassword,
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            key: keyIntoduction[2],
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Chapta",
                style: CustomTextStyle.medium(
                  12.sp,
                  color: CustomColorStyle.white,
                ),
              ),
              Container(
                width: CustomSize.width(context) / 4,
                margin: const EdgeInsets.only(
                  top: 8,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    4,
                  ),
                  border: Border.all(
                    color: CustomColorStyle.white,
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      "$chaptaPrimary + $chaptaSecondary = ",
                      style: CustomTextStyle.medium(
                        12.sp,
                        color: CustomColorStyle.white,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: chapta,
                        keyboardType: TextInputType.number,
                        cursorColor: CustomColorStyle.white,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2),
                        ],
                        style: CustomTextStyle.medium(
                          12.sp,
                          color: CustomColorStyle.white,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: ".......",
                          hintStyle: CustomTextStyle.medium(
                            12.sp,
                            color: CustomColorStyle.white.withOpacity(
                              0.4,
                            ),
                          ),
                          contentPadding: const EdgeInsets.only(
                            bottom: 2,
                          ),
                        ),
                        onChanged: onChanged,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Visibility(
          visible: chaperr,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Chapta belum di isi",
              style: CustomTextStyle.medium(
                10.sp,
                color: CustomColorStyle.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        CustomButton(
          key: keyIntoduction[3],
          onPressed: onLogin,
          label: "LOGIN",
          backgroundColor: CustomColorStyle.white,
          fontColor: CustomColorStyle.redPrimary,
        ),
      ],
    );
  }
}
