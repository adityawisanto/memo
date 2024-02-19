import 'package:memo/packages/packages.dart';

class EvidenceProof extends StatelessWidget {
  final String? file;
  final String title;
  final GestureTapCallback? onTapCamera;
  final GestureTapCallback? onTapGallery;
  final bool? withGallery;
  final String? assets;

  const EvidenceProof({
    super.key,
    required this.file,
    required this.title,
    required this.onTapCamera,
    this.onTapGallery,
    this.withGallery = true,
    this.assets,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomCard(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 16,
          ),
          child: Column(
            children: [
              file == ""
                  ? SizedBox(
                      width: CustomSize.width(context),
                      height: CustomSize.height(context) / 4,
                      child: Image.asset(
                        assets ?? "assets/images/evidence/evidence.png",
                        fit: BoxFit.cover,
                      ),
                    )
                  : GestureDetector(
                      onTap: () => showDialog(
                            context: context,
                            builder: (context) {
                              return EvidenceView(
                                file: file.toString(),
                              );
                            },
                          ),
                      child: Image.memory(
                        base64.decode(
                          file.toString().split(',').last,
                        ),
                        fit: BoxFit.cover,
                        width: CustomSize.width(context),
                        height: CustomSize.height(context) / 4,
                        errorBuilder: (context, error, stackTrace) => SizedBox(
                          width: CustomSize.width(context),
                          height: CustomSize.height(context) / 4,
                          child: Image.asset(
                            assets ?? "assets/images/evidence/evidence.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
              SizedBox(
                height: 8.h,
              ),
              Text(
                title,
                style: CustomTextStyle.bold(
                  10.sp,
                  color: CustomColorStyle.orangePrimary,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: onTapCamera,
                    child: CircleAvatar(
                      backgroundColor: CustomColorStyle.orangePrimary,
                      child: Icon(
                        Icons.camera,
                        color: CustomColorStyle.white,
                      ),
                    ),
                  ),
                  withGallery == true
                      ? SizedBox(
                          width: 8.w,
                        )
                      : const SizedBox.shrink(),
                  withGallery == true
                      ? GestureDetector(
                          onTap: onTapGallery,
                          child: CircleAvatar(
                            backgroundColor: CustomColorStyle.orangePrimary,
                            child: Icon(
                              Icons.image,
                              color: CustomColorStyle.white,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
