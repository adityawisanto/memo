import 'package:memo/packages/packages.dart';

class EvidenceView extends StatelessWidget {
  final String file;

  const EvidenceView({
    super.key,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: CustomColorStyle.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: SizedBox(
        width: CustomSize.width(context),
        height: CustomSize.height(context) / 3,
        child: PhotoView(
          imageProvider: MemoryImage(
            base64.decode(
              file.toString().split(',').last,
            ),
          ),
        ),
      ),
    );
  }
}
