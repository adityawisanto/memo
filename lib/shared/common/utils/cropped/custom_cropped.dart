import 'package:memo/packages/packages.dart';

import 'package:image/image.dart' as ui;

class CustomCropped {
  Future<File?> croppedImage(
    File imageFile, {
    String? mid,
    String? poi,
    String? address,
  }) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      cropStyle: CropStyle.rectangle,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
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
    if (croppedImage == null) {
      return null;
    } else {
      ui.Image? originalImage = ui.Image(
        width: 700,
        height: 700,
      );

      originalImage = ui.decodeImage(imageFile.readAsBytesSync());

      //Time
      String timeNow = DateTime.now().toString();

      String longlat =
          "${CustomDate.formatDate(timeNow)}\nMID : $mid, POI : $poi, \nLong : ${await CustomGeolocation().longitude()}, Lat : ${await CustomGeolocation().longitude()}\n$address\n${Platform.isAndroid ? await CustomDevice().getModelAndroid() : Platform.isIOS ? await CustomDevice().getModelIos() : "Device Not Detected"}";

      ui.drawString(
        originalImage!,
        longlat,
        font: ui.arial14,
        x: 16,
        y: 16,
        wrap: true,
      );

      File(croppedImage.path).writeAsBytesSync(
        ui.encodeBmp(
          originalImage,
        ),
      );
    }
    return File(croppedImage.path);
  }
}
