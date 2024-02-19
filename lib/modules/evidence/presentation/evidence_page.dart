import 'package:memo/packages/packages.dart';

class EvidencePage extends StatefulWidget {
  static const routeName = "/evidence";

  final EvidenceArgument evidenceArgument;

  const EvidencePage({
    super.key,
    required this.evidenceArgument,
  });

  @override
  State<EvidencePage> createState() => _EvidencePageState();
}

class _EvidencePageState extends State<EvidencePage> {
  final customPreferences = locator<CustomPreferences>();

  final List<GlobalKey> keyIntroduction = [
    GlobalKey(),
  ];

  String signBase64 = "";

  String cashierBase64 = "";

  String edcBase64 = "";

  String strukBase64 = "";

  String brizziBase64 = "";

  String qrisBase64 = "";

  String optionalPrimaryBase64 = "";

  String optionalSecondaryBase64 = "";

  Future<void> getCacheImage() async {
    final sign = await customPreferences.getSign();
    final cashier = await customPreferences.getCashier();
    final edc = await customPreferences.getEdc();
    final struk = await customPreferences.getStruk();
    final brizzi = await customPreferences.getBrizzi();
    final qris = await customPreferences.getQris();
    final optionalPrimary = await customPreferences.getOptional();
    final optionalSecondary = await customPreferences.getOptional2();

    setState(() {
      signBase64 = sign;
      cashierBase64 = cashier;
      edcBase64 = edc;
      strukBase64 = struk;
      brizziBase64 = brizzi;
      qrisBase64 = qris;
      optionalPrimaryBase64 = optionalPrimary;
      optionalSecondaryBase64 = optionalSecondary;
    });
  }

  Future<void> signCamera() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 700,
        maxHeight: 700,
        imageQuality: 12,
      );
      if (pickedFile != null) {
        File? img = File(pickedFile.path);
        img = await CustomCropped().croppedImage(
          img,
          mid: widget.evidenceArgument.lkmArgument!.dataTicket!.mid.toString(),
          poi: widget.evidenceArgument.lkmArgument!.dataTicket!.poi.toString(),
          address: widget.evidenceArgument.lkmArgument!.dataTicket!.address
              .toString(),
        );
        Uint8List signUint8List = await img!.readAsBytes();
        setState(() {
          signBase64 = base64Encode(signUint8List);
        });
        await customPreferences.saveSign(signBase64);
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> cashierCamera() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 700,
        maxHeight: 700,
        imageQuality: 12,
      );
      if (pickedFile != null) {
        File? img = File(pickedFile.path);
        img = await CustomCropped().croppedImage(
          img,
          mid: widget.evidenceArgument.lkmArgument!.dataTicket!.mid.toString(),
          poi: widget.evidenceArgument.lkmArgument!.dataTicket!.poi.toString(),
          address: widget.evidenceArgument.lkmArgument!.dataTicket!.address
              .toString(),
        );
        Uint8List cashierUint8List = await img!.readAsBytes();
        setState(() {
          cashierBase64 = base64Encode(cashierUint8List);
        });
        await customPreferences.saveCashier(cashierBase64);
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> edcCamera() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 700,
        maxHeight: 700,
        imageQuality: 12,
      );
      if (pickedFile != null) {
        File? img = File(pickedFile.path);
        img = await CustomCropped().croppedImage(
          img,
          mid: widget.evidenceArgument.lkmArgument!.dataTicket!.mid.toString(),
          poi: widget.evidenceArgument.lkmArgument!.dataTicket!.poi.toString(),
          address: widget.evidenceArgument.lkmArgument!.dataTicket!.address
              .toString(),
        );
        Uint8List edcUint8List = await img!.readAsBytes();
        setState(() {
          edcBase64 = base64Encode(edcUint8List);
        });
        await customPreferences.saveEdc(edcBase64);
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> strukCamera() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 700,
        maxHeight: 700,
        imageQuality: 12,
      );
      if (pickedFile != null) {
        File? img = File(pickedFile.path);
        img = await CustomCropped().croppedImage(
          img,
          mid: widget.evidenceArgument.lkmArgument!.dataTicket!.mid.toString(),
          poi: widget.evidenceArgument.lkmArgument!.dataTicket!.poi.toString(),
          address: widget.evidenceArgument.lkmArgument!.dataTicket!.address
              .toString(),
        );
        Uint8List strukUint8List = await img!.readAsBytes();
        setState(() {
          strukBase64 = base64Encode(strukUint8List);
        });
        await customPreferences.saveStruk(strukBase64);
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> brizziCamera() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 700,
        maxHeight: 700,
        imageQuality: 12,
      );
      if (pickedFile != null) {
        File? img = File(pickedFile.path);
        img = await CustomCropped().croppedImage(
          img,
          mid: widget.evidenceArgument.lkmArgument!.dataTicket!.mid.toString(),
          poi: widget.evidenceArgument.lkmArgument!.dataTicket!.poi.toString(),
          address: widget.evidenceArgument.lkmArgument!.dataTicket!.address
              .toString(),
        );
        Uint8List brizziUint8List = await img!.readAsBytes();
        setState(() {
          brizziBase64 = base64Encode(brizziUint8List);
        });
        await customPreferences.saveBrizzi(brizziBase64);
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> qrisCamera() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 700,
        maxHeight: 700,
        imageQuality: 12,
      );
      if (pickedFile != null) {
        File? img = File(pickedFile.path);
        img = await CustomCropped().croppedImage(
          img,
          mid: widget.evidenceArgument.lkmArgument!.dataTicket!.mid.toString(),
          poi: widget.evidenceArgument.lkmArgument!.dataTicket!.poi.toString(),
          address: widget.evidenceArgument.lkmArgument!.dataTicket!.address
              .toString(),
        );
        Uint8List qrisUint8List = await img!.readAsBytes();
        setState(() {
          qrisBase64 = base64Encode(qrisUint8List);
        });
        await customPreferences.saveQris(qrisBase64);
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> optionalPrimaryCamera() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 700,
        maxHeight: 700,
        imageQuality: 12,
      );
      if (pickedFile != null) {
        File? img = File(pickedFile.path);
        img = await CustomCropped().croppedImage(
          img,
          mid: widget.evidenceArgument.lkmArgument!.dataTicket!.mid.toString(),
          poi: widget.evidenceArgument.lkmArgument!.dataTicket!.poi.toString(),
          address: widget.evidenceArgument.lkmArgument!.dataTicket!.address
              .toString(),
        );
        Uint8List optionalPrimaryUint8List = await img!.readAsBytes();
        setState(() {
          optionalPrimaryBase64 = base64Encode(optionalPrimaryUint8List);
        });
        await customPreferences.saveOptional(optionalPrimaryBase64);
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> optionalSecondaryCamera() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 700,
        maxHeight: 700,
        imageQuality: 12,
      );
      if (pickedFile != null) {
        File? img = File(pickedFile.path);
        img = await CustomCropped().croppedImage(
          img,
          mid: widget.evidenceArgument.lkmArgument!.dataTicket!.mid.toString(),
          poi: widget.evidenceArgument.lkmArgument!.dataTicket!.poi.toString(),
          address: widget.evidenceArgument.lkmArgument!.dataTicket!.address
              .toString(),
        );
        Uint8List optionalSecondaryUint8List = await img!.readAsBytes();
        setState(() {
          optionalSecondaryBase64 = base64Encode(optionalSecondaryUint8List);
        });
        await customPreferences.saveOptional2(optionalSecondaryBase64);
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> optionalPrimaryGallery() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 700,
        maxHeight: 700,
        imageQuality: 12,
      );
      if (pickedFile != null) {
        File? img = File(pickedFile.path);
        img = await CustomCropped().croppedImage(
          img,
          mid: widget.evidenceArgument.lkmArgument!.dataTicket!.mid.toString(),
          poi: widget.evidenceArgument.lkmArgument!.dataTicket!.poi.toString(),
          address: widget.evidenceArgument.lkmArgument!.dataTicket!.address
              .toString(),
        );
        Uint8List optionalPrimaryUint8List = await img!.readAsBytes();
        setState(() {
          optionalPrimaryBase64 = base64Encode(optionalPrimaryUint8List);
        });
        await customPreferences.saveOptional(optionalPrimaryBase64);
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> optionalSecondaryGallery() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 700,
        maxHeight: 700,
        imageQuality: 12,
      );
      if (pickedFile != null) {
        File? img = File(pickedFile.path);
        img = await CustomCropped().croppedImage(
          img,
          mid: widget.evidenceArgument.lkmArgument!.dataTicket!.mid.toString(),
          poi: widget.evidenceArgument.lkmArgument!.dataTicket!.poi.toString(),
          address: widget.evidenceArgument.lkmArgument!.dataTicket!.address
              .toString(),
        );
        Uint8List optionalSecondaryUint8List = await img!.readAsBytes();
        setState(() {
          optionalSecondaryBase64 = base64Encode(optionalSecondaryUint8List);
        });
        await customPreferences.saveOptional2(optionalSecondaryBase64);
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    getCacheImage();
    checkIntroEvidence(
      keyIntroduction,
      context,
      customPreferences,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withoutPopScope(
        "Foto",
        onTap: () => CustomNavigation.back(context),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 70,
        ),
        child: Column(
          children: [
            widget.evidenceArgument.lkmArgument!.status!.title == "Done"
                ? evidenceDone()
                : widget.evidenceArgument.lkmArgument!.status!.title ==
                        "Pending"
                    ? evidencePending()
                    : const SizedBox.shrink(),
            SizedBox(
              height: 16.h,
            ),
            widget.evidenceArgument.lkmArgument!.status!.title == "Pending" &&
                    signBase64 != "" &&
                    optionalPrimaryBase64 != ""
                ? CustomButton(
                    onPressed: () => CustomNavigation.intentWithData(
                      context,
                      SignaturePage.routeName,
                      SignatureArgument(
                        evidenceArgument: widget.evidenceArgument,
                        signBase64: signBase64,
                        cashierBase64: cashierBase64,
                        edcBase64: edcBase64,
                        strukBase64: strukBase64,
                        brizziBase64: brizziBase64,
                        qrisBase64: qrisBase64,
                        optionalBase64: optionalPrimaryBase64,
                        optional2Base64: optionalSecondaryBase64,
                      ),
                    ),
                    label: "Selanjutnya",
                  )
                : widget.evidenceArgument.lkmArgument!.status!.title ==
                            "Done" &&
                        signBase64 != "" &&
                        cashierBase64 != "" &&
                        edcBase64 != "" &&
                        strukBase64 != "" &&
                        brizziBase64 != "" &&
                        qrisBase64 != ""
                    ? CustomButton(
                        onPressed: () => CustomNavigation.intentWithData(
                          context,
                          SignaturePage.routeName,
                          SignatureArgument(
                            evidenceArgument: widget.evidenceArgument,
                            signBase64: signBase64,
                            cashierBase64: cashierBase64,
                            edcBase64: edcBase64,
                            strukBase64: strukBase64,
                            brizziBase64: brizziBase64,
                            qrisBase64: qrisBase64,
                            optionalBase64: optionalPrimaryBase64,
                            optional2Base64: optionalSecondaryBase64,
                          ),
                        ),
                        label: "Selanjutnya",
                      )
                    : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget evidenceDone() {
    return widget.evidenceArgument.lkmArgument!.dataTicket!.installType
                .toString() ==
            MasterJsonTicket.ttDist
        ? Column(
            children: [
              Row(
                children: [
                  EvidenceProof(
                    key: keyIntroduction[0],
                    title: "PLANG MERCHANT",
                    assets: "assets/images/evidence/plang.png",
                    file: signBase64,
                    onTapCamera: () async => signCamera(),
                    withGallery: false,
                  ),
                  EvidenceProof(
                    title: "FOTO KASIR DENGAN EDC",
                    file: cashierBase64,
                    assets: "assets/images/evidence/cashier.png",
                    onTapCamera: () async => cashierCamera(),
                    withGallery: false,
                  )
                ],
              ),
              Row(
                children: [
                  EvidenceProof(
                    title: "BELAKANG EDC+THERMAL",
                    assets: "assets/images/evidence/edc.png",
                    file: edcBase64,
                    onTapCamera: () async => edcCamera(),
                    withGallery: false,
                  ),
                ],
              ),
              Row(
                children: [
                  EvidenceProof(
                    title: "STRUK OPTIONAL",
                    file: optionalPrimaryBase64,
                    assets: "assets/images/evidence/optional.png",
                    onTapCamera: () async => optionalPrimaryCamera(),
                    withGallery: false,
                  ),
                  const Expanded(
                    child: SizedBox.shrink(),
                  ),
                ],
              )
            ],
          )
        : Column(
            children: [
              Row(
                children: [
                  EvidenceProof(
                    key: keyIntroduction[0],
                    title: "PLANG MERCHANT",
                    assets: "assets/images/evidence/plang.png",
                    file: signBase64,
                    onTapCamera: () async => signCamera(),
                    withGallery: false,
                  ),
                  EvidenceProof(
                    title: "FOTO KASIR DENGAN EDC",
                    file: cashierBase64,
                    assets: "assets/images/evidence/cashier.png",
                    onTapCamera: () async => cashierCamera(),
                    withGallery: false,
                  )
                ],
              ),
              Row(
                children: [
                  EvidenceProof(
                    title: "BELAKANG EDC+THERMAL",
                    assets: "assets/images/evidence/edc.png",
                    file: edcBase64,
                    onTapCamera: () async => edcCamera(),
                    withGallery: false,
                  ),
                  EvidenceProof(
                    title: "STRUK SALE",
                    file: strukBase64,
                    assets: "assets/images/evidence/sale.png",
                    onTapCamera: () async => strukCamera(),
                    withGallery: false,
                  ),
                ],
              ),
              Row(
                children: [
                  EvidenceProof(
                    title: "STRUK BRIZZI",
                    file: brizziBase64,
                    assets: "assets/images/evidence/brizzi.png",
                    onTapCamera: () async => brizziCamera(),
                    withGallery: false,
                  ),
                  EvidenceProof(
                    title: "STRUK QRIS",
                    file: qrisBase64,
                    assets: "assets/images/evidence/qris.png",
                    onTapCamera: () async => qrisCamera(),
                    withGallery: false,
                  ),
                ],
              ),
              Row(
                children: [
                  EvidenceProof(
                    title: "STRUK OPTIONAL",
                    file: optionalPrimaryBase64,
                    assets: "assets/images/evidence/optional.png",
                    onTapCamera: () async => optionalPrimaryCamera(),
                    withGallery: false,
                  ),
                  const Expanded(
                    child: SizedBox.shrink(),
                  ),
                ],
              )
            ],
          );
  }

  Widget evidencePending() {
    return Column(
      children: [
        Row(
          key: keyIntroduction[0],
          children: [
            EvidenceProof(
              title: "PLANG MERCHANT",
              assets: "assets/images/evidence/plang.png",
              file: signBase64,
              onTapCamera: () async => signCamera(),
              withGallery: false,
            ),
          ],
        ),
        Row(
          children: [
            EvidenceProof(
              title: "FOTO EVIDENCE",
              file: optionalPrimaryBase64,
              onTapCamera: () async => optionalPrimaryCamera(),
              onTapGallery: () async => optionalPrimaryGallery(),
            ),
            EvidenceProof(
              title: "FOTO EVIDENCE 2",
              file: optionalSecondaryBase64,
              onTapCamera: () async => optionalSecondaryCamera(),
              onTapGallery: () async => optionalSecondaryGallery(),
            ),
          ],
        )
      ],
    );
  }
}
