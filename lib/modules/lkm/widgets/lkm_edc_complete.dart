import 'package:memo/packages/packages.dart';

class LkmEdcComplete extends StatelessWidget {
  final DataAudit dataAudit;
  final int index;
  final void Function(String)? onChanged;

  const LkmEdcComplete({
    super.key,
    required this.dataAudit,
    required this.index,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              dataAudit.name.toString(),
              style: CustomTextStyle.regular(
                10.sp,
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              textAlign: TextAlign.center,
              textCapitalization: TextCapitalization.characters,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              cursorColor: CustomColorStyle.orangePrimary,
              decoration: InputDecoration(
                hintText: dataAudit.name,
                hintStyle: CustomTextStyle.medium(
                  10.sp,
                  color: CustomColorStyle.grayPrimary.withOpacity(
                    0.2,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                  borderSide: BorderSide(
                    width: 1,
                    color: CustomColorStyle.grayPrimary,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                  borderSide: BorderSide(
                    color: CustomColorStyle.grayPrimary,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                  borderSide: BorderSide(
                    color: CustomColorStyle.grayPrimary,
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
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
