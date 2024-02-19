import 'package:memo/packages/packages.dart';

class Bundle extends Equatable {
  final String? message;

  const Bundle({
    required this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

class BundleArgument extends Equatable {
  final SignatureArgument? signatureArgument;
  final String? merchantName;
  final String? merchantPhone;
  final Uint8List? merchantTtd;
  final String? meriName;
  final String? meriPhone;
  final Uint8List? meriTtd;

  const BundleArgument({
    required this.signatureArgument,
    required this.merchantName,
    required this.merchantPhone,
    required this.merchantTtd,
    required this.meriName,
    required this.meriPhone,
    required this.meriTtd,
  });

  @override
  List<Object?> get props => [
        signatureArgument,
        merchantName,
        merchantPhone,
        merchantTtd,
        meriName,
        meriPhone,
        meriTtd,
      ];
}
