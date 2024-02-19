import 'package:memo/packages/packages.dart';

class BundleTextDone extends StatelessWidget {
  final BundleArgument bundleArgument;

  const BundleTextDone({
    super.key,
    required this.bundleArgument,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BundleTitleItem(
          title: "Purchase",
        ),
        ListView.builder(
          itemCount: bundleArgument
              .signatureArgument!.evidenceArgument!.purchase!.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final data =
                bundleArgument.signatureArgument!.evidenceArgument!.purchase!;
            String key = bundleArgument
                .signatureArgument!.evidenceArgument!.purchase!.keys
                .elementAt(index);
            String value = data[key].toString();
            return BundleDescriptionItem(
              title: key,
              description: value == "true" ? "OK" : "Not OK",
            );
          },
        ),
        const BundleTitleItem(
          title: "Brizzi",
        ),
        ListView.builder(
          itemCount: bundleArgument
              .signatureArgument!.evidenceArgument!.brizzi!.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final data =
                bundleArgument.signatureArgument!.evidenceArgument!.brizzi!;
            String key = bundleArgument
                .signatureArgument!.evidenceArgument!.brizzi!.keys
                .elementAt(index);
            String value = data[key].toString();
            return BundleDescriptionItem(
              title: key,
              description: value == "true" ? "OK" : "Not OK",
            );
          },
        ),
        const BundleTitleItem(
          title: "QRIS",
        ),
        ListView.builder(
          itemCount:
              bundleArgument.signatureArgument!.evidenceArgument!.qris!.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final data =
                bundleArgument.signatureArgument!.evidenceArgument!.qris!;
            String key = bundleArgument
                .signatureArgument!.evidenceArgument!.qris!.keys
                .elementAt(index);
            String value = data[key].toString();
            return BundleDescriptionItem(
              title: key,
              description: value == "true" ? "OK" : "Not OK",
            );
          },
        ),
        const BundleTitleItem(
          title: "Kelengkapan EDC",
          description: "Jumlah",
        ),
        ListView.builder(
          itemCount: bundleArgument
              .signatureArgument!.evidenceArgument!.edcComplete!.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final data = bundleArgument
                .signatureArgument!.evidenceArgument!.edcComplete!;
            String key = bundleArgument
                .signatureArgument!.evidenceArgument!.edcComplete!.keys
                .elementAt(index);
            String value = data[key].toString();
            return BundleDescriptionItem(
              title: key,
              description: value,
            );
          },
        ),
        const BundleTitleItem(
          title: "Aktivitas",
        ),
        ListView.builder(
          itemCount: bundleArgument
              .signatureArgument!.evidenceArgument!.activity!.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final data =
                bundleArgument.signatureArgument!.evidenceArgument!.activity!;
            String key = bundleArgument
                .signatureArgument!.evidenceArgument!.activity!.keys
                .elementAt(index);
            String value = data[key].toString();
            return BundleDescriptionItem(
              title: key,
              description: value == "true" ? "OK" : "Not OK",
            );
          },
        ),
        const BundleTitleItem(
          title: "Note",
        ),
        ListView.builder(
          itemCount:
              bundleArgument.signatureArgument!.evidenceArgument!.note!.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final data =
                bundleArgument.signatureArgument!.evidenceArgument!.note!;
            String key = bundleArgument
                .signatureArgument!.evidenceArgument!.note!.keys
                .elementAt(index);
            String value = data[key].toString();
            return BundleDescriptionItem(
              title: key,
              description: value == "true" ? "OK" : "Not OK",
            );
          },
        ),
        const BundleTitleItem(
          title: "Inventory yang diberikan",
          description: "Jumlah",
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: bundleArgument
              .signatureArgument!.evidenceArgument!.listItem!.length,
          itemBuilder: (context, index) {
            return BundleDescriptionItem(
              title: bundleArgument
                  .signatureArgument!.evidenceArgument!.listItem![index].type
                  .toString(),
              description: bundleArgument
                  .signatureArgument!.evidenceArgument!.listItem![index].def
                  .toString(),
            );
          },
        ),
        const BundleTitleItem(
          title: "EDC",
          description: "Keterangan",
        ),
        BundleDescriptionItem(
          title: "Brand",
          description: bundleArgument
              .signatureArgument!.evidenceArgument!.edcType
              .toString(),
        ),
        BundleDescriptionItem(
          title: "SN",
          description: bundleArgument.signatureArgument!.evidenceArgument!.sn
                  .toString()
                  .isEmpty
              ? "Tidak Tersedia"
              : bundleArgument.signatureArgument!.evidenceArgument!.sn
                  .toString(),
        ),
      ],
    );
  }
}
