import 'package:memo/packages/packages.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = "/profile";

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final sallaryBloc = locator<SallaryBloc>();
  final userBloc = locator<UserBloc>();
  final profileBloc = locator<UserBloc>();
  final customPreferences = locator<CustomPreferences>();

  final List<GlobalKey> keyIntroduction = [
    GlobalKey(),
    GlobalKey(),
  ];

  File? profileFile;
  Uint8List? profileUint8List;
  String profilePath = "";

  String? device;
  String? versioning;

  bool loading = false;

  Future<void> profileCamera() async {
    CustomNavigation.back(context);
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 700,
        maxHeight: 700,
        imageQuality: 12,
      );
      if (pickedFile != null) {
        File? img = File(pickedFile.path);
        img = await croppedImage(img);
        profileUint8List = await img!.readAsBytes();
        profilePath = pickedFile.path;
        setState(() {
          profileFile = img;
        });

        profileBloc.add(
          UserSubmitted(
            image: base64Encode(profileUint8List!),
          ),
        );
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> profileGallery() async {
    CustomNavigation.back(context);
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 700,
        maxHeight: 700,
        imageQuality: 12,
      );
      if (pickedFile != null) {
        File? img = File(pickedFile.path);
        img = await croppedImage(img);
        profileUint8List = await img!.readAsBytes();
        profilePath = pickedFile.path;
        setState(() {
          profileFile = img;
        });

        profileBloc.add(
          UserSubmitted(
            image: base64Encode(profileUint8List!),
          ),
        );
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<File?> croppedImage(File imageFile) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      cropStyle: CropStyle.circle,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Edit Foto',
          toolbarColor: CustomColorStyle.orangePrimary,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Edit Foto',
        ),
      ],
    );
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  Future<void> getDevice() async {
    final manucature = Platform.isAndroid
        ? await CustomDevice().getManufactureAndroid()
        : await CustomDevice().getManufactureIos();
    final systenName = Platform.isAndroid
        ? await CustomDevice().getSystemVersionAndroid()
        : await CustomDevice().getSystemVersionIos();
    final version = Platform.isAndroid
        ? await CustomDevice().getVersionAndroid()
        : await CustomDevice().getVersionIos();

    versioning = await CustomApplication().getVersion();

    setState(() {
      device = "$manucature\nOS: $systenName\nSDK Ver: $version";
      versioning = versioning;
    });
  }

  @override
  void dispose() {
    sallaryBloc.close();
    userBloc.close();
    profileBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    getDevice();
    sallaryBloc.add(
      SallaryGetted(),
    );
    userBloc.add(
      UserGetted(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withoutPopScope(
        "PROFILE",
        centerTitle: false,
        colorIcon: CustomColorStyle.white,
        colorText: CustomColorStyle.white,
        backgroundColor: CustomColorStyle.redPrimary,
        onTap: () => CustomNavigation.back(context),
      ),
      body: BlocListener(
        bloc: profileBloc,
        listener: (context, state) {
          if (state is UserLoading) {
            setState(() {
              loading = true;
            });
          } else if (state is UserPostSuccess) {
            setState(() {
              loading = false;
            });
          } else if (state is UserFailure) {
            setState(() {
              loading = false;
            });
            CustomToast.failure(
              state.message,
            );
          }
        },
        child: Column(
          children: [
            ProfileSallary(
              sallaryBloc: sallaryBloc,
            ),
            ProfileUser(
              userBloc: userBloc,
              keyIntroduction: keyIntroduction,
              customPreferences: customPreferences,
              onTapCamera: () => profileCamera(),
              onTapGallery: () => profileGallery(),
              device: device.toString(),
              versioning: versioning ?? "",
              loading: loading,
            ),
          ],
        ),
      ),
    );
  }
}
