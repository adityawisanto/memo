import 'package:memo/packages/packages.dart';

class BundleTextPending extends StatelessWidget {
  final BundleArgument bundleArgument;

  const BundleTextPending({
    super.key,
    required this.bundleArgument,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BundleTitleItem(
          title: "Tambahan",
        ),
        BundleDescriptionItem(
          title: "List EDC Lain",
          description: bundleArgument
                  .signatureArgument!.evidenceArgument!.anotherEdc!.isEmpty
              ? "Tidak Tersedia"
              : bundleArgument.signatureArgument!.evidenceArgument!.anotherEdc!
                  .join(", ")
                  .toString(),
        ),
        BundleDescriptionItem(
          title: "Tipe Merchant",
          description: bundleArgument
                      .signatureArgument!.evidenceArgument!.merchantType ==
                  null
              ? "Tidak Tersedia"
              : bundleArgument
                  .signatureArgument!.evidenceArgument!.merchantType!.title
                  .toString(),
        ),
        BundleDescriptionItem(
          title: "EDC Utama",
          description: bundleArgument.signatureArgument!.evidenceArgument!
                      .lkmArgument!.edcPrimary ==
                  null
              ? "Tidak Tersedia"
              : bundleArgument.signatureArgument!.evidenceArgument!.lkmArgument!
                  .edcPrimary!.title
                  .toString(),
        ),
        BundleDescriptionItem(
          title: "Keterangan",
          description: bundleArgument.signatureArgument!.evidenceArgument!.visit
                      .toString() ==
                  ""
              ? "Tidak Tersedia"
              : bundleArgument.signatureArgument!.evidenceArgument!.visit
                  .toString(),
        ),
        BundleDescriptionItem(
          title: "Jam Buka Merchant",
          description: bundleArgument
                      .signatureArgument!.evidenceArgument!.clockOpen
                      .toString() ==
                  ""
              ? "Tidak Tersedia"
              : bundleArgument.signatureArgument!.evidenceArgument!.clockOpen
                  .toString(),
        ),
        BundleDescriptionItem(
          title: "Jam Tutup Merchant",
          description: bundleArgument
                      .signatureArgument!.evidenceArgument!.clockClose
                      .toString() ==
                  ""
              ? "Tidak Tersedia"
              : bundleArgument.signatureArgument!.evidenceArgument!.clockClose
                  .toString(),
        ),
        BundleDescriptionItem(
          title: "Alamat Merchant",
          description: bundleArgument
                      .signatureArgument!.evidenceArgument!.address
                      .toString() ==
                  ""
              ? "Tidak Tersedia"
              : bundleArgument.signatureArgument!.evidenceArgument!.address
                  .toString(),
        ),
        BundleDescriptionItem(
          title: "Nama Kasir",
          description: bundleArgument.merchantName.toString() == ""
              ? "Tidak Tersedia"
              : bundleArgument.merchantName.toString(),
        ),
        BundleDescriptionItem(
          title: "No HP Kasir",
          description: bundleArgument.merchantPhone.toString() == ""
              ? "Tidak Tersedia"
              : bundleArgument.merchantPhone.toString(),
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }
}
