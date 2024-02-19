import 'package:memo/packages/packages.dart';

class LkmRadioItem extends StatelessWidget {
  final DataAudit dataAudit;
  final String? selectValue;
  final void Function(String?)? onChangedOk;
  final void Function(String?)? onChangedNotOk;

  const LkmRadioItem({
    super.key,
    required this.dataAudit,
    required this.selectValue,
    required this.onChangedOk,
    required this.onChangedNotOk,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            dataAudit.name.toString(),
            style: CustomTextStyle.regular(
              10.sp,
            ),
          ),
        ),
        Row(
          children: [
            Radio(
              value: "true",
              fillColor: MaterialStateColor.resolveWith(
                (states) => CustomColorStyle.orangePrimary,
              ),
              groupValue: selectValue ?? '',
              onChanged: onChangedOk,
            ),
            Text(
              "OK",
              style: CustomTextStyle.regular(
                10.sp,
              ),
            ),
            Radio(
              value: "false",
              groupValue: selectValue ?? '',
              fillColor: MaterialStateColor.resolveWith(
                (states) => CustomColorStyle.orangePrimary,
              ),
              onChanged: onChangedNotOk,
            ),
            Text(
              "Not OK",
              style: CustomTextStyle.regular(
                10.sp,
              ),
            ),
          ],
        )
      ],
    );
  }
}
