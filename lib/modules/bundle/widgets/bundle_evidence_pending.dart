import 'package:memo/packages/packages.dart';

class BundleEvidencePending extends StatelessWidget {
  final BundleArgument bundleArgument;

  const BundleEvidencePending({
    super.key,
    required this.bundleArgument,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          child: BundleFileItem(
            title: "Foto Plang Merchant",
            image: bundleArgument.signatureArgument!.signBase64.toString(),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        CustomCard(
          child: BundleFileItem(
            title: "Foto Evidence",
            image: bundleArgument.signatureArgument!.optionalBase64.toString(),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        CustomCard(
          child: BundleFileItem(
            title: "Foto Evidence (Optional)",
            image: bundleArgument.signatureArgument!.optional2Base64.toString(),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        CustomCard(
          child: BundleFileItem(
            title: "Tanda Tangan Merchant",
            image: bundleArgument.merchantTtd == null
                ? ""
                : base64.encode(
                    bundleArgument.merchantTtd!,
                  ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        CustomCard(
          child: BundleFileItem(
            title: "Tanda Tangan Teknisi",
            image: bundleArgument.meriTtd == null
                ? ""
                : base64.encode(
                    bundleArgument.meriTtd!,
                  ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
