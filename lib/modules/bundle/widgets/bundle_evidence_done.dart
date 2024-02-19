import 'package:memo/packages/packages.dart';

class BundleEvidenceDone extends StatelessWidget {
  final BundleArgument bundleArgument;

  const BundleEvidenceDone({
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
            title: "Foto/Selfie Kasir dengan EDC",
            image: bundleArgument.signatureArgument!.cashierBase64.toString(),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        CustomCard(
          child: BundleFileItem(
            title: "Foto Bagian Belakang EDC",
            image: bundleArgument.signatureArgument!.edcBase64.toString(),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        CustomCard(
          child: BundleFileItem(
            title: "Foto Struk Sale",
            image: bundleArgument.signatureArgument!.strukBase64.toString(),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        CustomCard(
          child: BundleFileItem(
            title: "Foto Struk Brizzi",
            image: bundleArgument.signatureArgument!.brizziBase64.toString(),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        CustomCard(
          child: BundleFileItem(
            title: "Foto Struk QRIS",
            image: bundleArgument.signatureArgument!.qrisBase64.toString(),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        CustomCard(
          child: BundleFileItem(
            title: "Foto Struk Optional",
            image: bundleArgument.signatureArgument!.optionalBase64.toString(),
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
                : base64Encode(
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
                : base64Encode(
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
