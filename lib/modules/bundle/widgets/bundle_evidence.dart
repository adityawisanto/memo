import 'package:memo/packages/packages.dart';

class BundleEvidence extends StatelessWidget {
  final BundleArgument bundleArgument;

  const BundleEvidence({
    super.key,
    required this.bundleArgument,
  });

  @override
  Widget build(BuildContext context) {
    return bundleArgument.signatureArgument!.evidenceArgument!.lkmArgument!
                .status!.title ==
            "Done"
        ? BundleEvidenceDone(
            bundleArgument: bundleArgument,
          )
        : BundleEvidencePending(
            bundleArgument: bundleArgument,
          );
  }
}
