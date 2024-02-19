import 'package:memo/packages/packages.dart';

class SignatureArgument extends Equatable {
  final EvidenceArgument? evidenceArgument;
  final String? signBase64;
  final String? cashierBase64;
  final String? edcBase64;
  final String? strukBase64;
  final String? brizziBase64;
  final String? qrisBase64;
  final String? optionalBase64;
  final String? optional2Base64;

  const SignatureArgument({
    required this.evidenceArgument,
    required this.signBase64,
    required this.cashierBase64,
    required this.edcBase64,
    required this.strukBase64,
    required this.brizziBase64,
    required this.qrisBase64,
    required this.optionalBase64,
    required this.optional2Base64,
  });

  @override
  List<Object?> get props => [
        evidenceArgument,
        signBase64,
        cashierBase64,
        edcBase64,
        strukBase64,
        brizziBase64,
        qrisBase64,
        optionalBase64,
        optional2Base64,
      ];
}
