import 'package:memo/packages/packages.dart';
import 'package:signature/signature.dart';

class SignatureForm extends StatelessWidget {
  final List<GlobalKey>? keyIntroduction;
  final SignatureController signatureController;
  final String title;
  final String description;
  final TextEditingController name;
  final TextEditingController phone;
  final bool? withLine;
  final bool? withButton;
  final VoidCallback? onPressed;

  const SignatureForm({
    super.key,
    this.keyIntroduction,
    required this.signatureController,
    required this.title,
    required this.description,
    required this.name,
    required this.phone,
    this.withLine = true,
    this.withButton,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: CustomTextStyle.bold(
            12.sp,
            color: CustomColorStyle.orangePrimary,
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        Text(
          description,
          style: CustomTextStyle.medium(
            10.sp,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 4.h,
        ),
        GestureDetector(
          onTap: () => signatureController.clear(),
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: CustomColorStyle.orangePrimary,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
              child: Text(
                "Clear",
                style: CustomTextStyle.medium(
                  8.sp,
                  color: CustomColorStyle.orangePrimary,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Container(
          key: keyIntroduction?[0],
          height: CustomSize.height(context) / 6,
          decoration: BoxDecoration(
            border: Border.all(
              color: CustomColorStyle.orangePrimary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
          child: Signature(
            controller: signatureController,
            width: CustomSize.width(context) / 1.1,
            height: CustomSize.height(context) / 6.2,
            backgroundColor: CustomColorStyle.transparent,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        TextFormField(
          key: keyIntroduction?[1],
          controller: name,
          textAlign: TextAlign.center,
          textCapitalization: TextCapitalization.words,
          cursorColor: CustomColorStyle.orangePrimary,
          decoration: InputDecoration(
            hintText: "Nama",
            hintStyle: CustomTextStyle.medium(
              10.sp,
              color: CustomColorStyle.grayPrimary.withOpacity(
                0.2,
              ),
            ),
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
        TextFormField(
          key: keyIntroduction?[2],
          controller: phone,
          textAlign: TextAlign.center,
          textCapitalization: TextCapitalization.characters,
          keyboardType: TextInputType.number,
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
          height: 16.h,
        ),
        withLine == true
            ? Divider(
                height: 2,
                color: CustomColorStyle.blackPrimary.withOpacity(
                  0.4,
                ),
              )
            : const SizedBox.shrink(),
        withButton == true
            ? CustomButton(
                onPressed: onPressed,
                label: "Selanjutnya",
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
