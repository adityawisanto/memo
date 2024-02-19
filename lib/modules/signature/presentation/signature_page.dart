import 'package:memo/packages/packages.dart';
import 'package:signature/signature.dart';

class SignaturePage extends StatefulWidget {
  static const routeName = "/signature";

  final SignatureArgument signatureArgument;

  const SignaturePage({
    super.key,
    required this.signatureArgument,
  });

  @override
  State<SignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  final customPreferences = locator<CustomPreferences>();

  final merchantName = TextEditingController();
  final merchantPhone = TextEditingController();
  SignatureController? merchantSignature;

  final meriName = TextEditingController();
  final meriPhone = TextEditingController();
  SignatureController? meriSignature;

  final List<GlobalKey> keyIntroduction = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  Future<String> getUsername() async {
    final results = await customPreferences.getUsername();
    setState(() {
      meriName.text = results;
    });
    return meriName.text;
  }

  Future<String> getPhone() async {
    final results = await customPreferences.getPhone();
    setState(() {
      meriPhone.text = results;
    });
    return meriPhone.text;
  }

  Future<Uint8List?> exportSignature(
      SignatureController signatureController) async {
    final exportController = SignatureController(
      penStrokeWidth: 2,
      exportBackgroundColor: Colors.white,
      penColor: Colors.black,
      points: signatureController.points,
    );

    final signature = exportController.toPngBytes();

    exportController.dispose();

    return signature;
  }

  @override
  void dispose() {
    merchantSignature!.dispose();
    merchantName.dispose();
    merchantPhone.dispose();

    meriSignature!.dispose();
    meriName.dispose();
    meriPhone.dispose();
    super.dispose();
  }

  @override
  void initState() {
    merchantSignature = SignatureController(
      penStrokeWidth: 2,
      penColor: CustomColorStyle.blackPrimary,
    );

    meriSignature = SignatureController(
      penStrokeWidth: 2,
      penColor: CustomColorStyle.blackPrimary,
    );

    getUsername();
    getPhone();
    checkIntroSignature(
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
        "Tanda Tangan",
        onTap: () => CustomNavigation.back(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 50,
        ),
        child: Center(
          child: Column(
            children: [
              SignatureForm(
                keyIntroduction: keyIntroduction,
                signatureController: merchantSignature!,
                title: "MERCHANT",
                description:
                    "Dengan ini saya menyatakan bahwa merchant sudah di training ulang / edukasi",
                name: merchantName,
                phone: merchantPhone,
              ),
              SizedBox(
                height: 16.h,
              ),
              SignatureForm(
                signatureController: meriSignature!,
                title: "PETUGAS / TEKNISI",
                description:
                    "Dengan ini saya menyatakan bahwa telah melakukan training ulang / edukasi pada merchant bersangkutan",
                name: meriName,
                phone: meriPhone,
                withLine: false,
                withButton: true,
                onPressed: () async => {
                  if (widget.signatureArgument.evidenceArgument!.lkmArgument!
                          .status!.title ==
                      "Done")
                    {
                      if (merchantSignature!.isEmpty)
                        {
                          CustomDialog().information(
                            "Tanda Tangan Merchant masih kosong",
                            "Silahkan diisi secara lengkap",
                            negative: () => CustomNavigation.back(context),
                            withNetral: true,
                            no: "Baik",
                          ),
                        }
                      else if (merchantName.text.isEmpty)
                        {
                          CustomDialog().information(
                            "Nama Merchant masih kosong",
                            "Silahkan diisi secara lengkap",
                            negative: () => CustomNavigation.back(context),
                            withNetral: true,
                            no: "Baik",
                          ),
                        }
                      else if (merchantPhone.text.isEmpty)
                        {
                          CustomDialog().information(
                            "No. HP Merchant masih kosong",
                            "Silahkan diisi secara lengkap",
                            negative: () => CustomNavigation.back(context),
                            withNetral: true,
                            no: "Baik",
                          ),
                        }
                      else if (meriSignature!.isEmpty)
                        {
                          CustomDialog().information(
                            "Tanda Tangan Petugas masih kosong",
                            "Silahkan diisi secara lengkap",
                            negative: () => CustomNavigation.back(context),
                            withNetral: true,
                            no: "Baik",
                          ),
                        }
                      else if (meriName.text.isEmpty)
                        {
                          CustomDialog().information(
                            "Nama Petugas masih kosong",
                            "Silahkan diisi secara lengkap",
                            negative: () => CustomNavigation.back(context),
                            withNetral: true,
                            no: "Baik",
                          ),
                        }
                      else if (meriPhone.text.isEmpty)
                        {
                          CustomDialog().information(
                            "No. HP Petugas masih kosong",
                            "Silahkan diisi secara lengkap",
                            negative: () => CustomNavigation.back(context),
                            withNetral: true,
                            no: "Baik",
                          ),
                        }
                      else
                        CustomNavigation.intentWithData(
                          context,
                          BundlePage.routeName,
                          BundleArgument(
                            signatureArgument: widget.signatureArgument,
                            merchantName: merchantName.text,
                            merchantPhone: merchantPhone.text,
                            merchantTtd: await exportSignature(
                              merchantSignature!,
                            ),
                            meriName: meriName.text,
                            meriPhone: meriPhone.text,
                            meriTtd: await exportSignature(
                              meriSignature!,
                            ),
                          ),
                        )
                    }
                  else
                    {
                      CustomNavigation.intentWithData(
                        context,
                        BundlePage.routeName,
                        BundleArgument(
                          signatureArgument: widget.signatureArgument,
                          merchantName: merchantName.text,
                          merchantPhone: merchantPhone.text,
                          merchantTtd: await exportSignature(
                            merchantSignature!,
                          ),
                          meriName: meriName.text,
                          meriPhone: meriPhone.text,
                          meriTtd: await exportSignature(
                            meriSignature!,
                          ),
                        ),
                      )
                    }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
