import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageHandler {
  static Future<XFile?> pickImage(ImageSource source) async {
    return ImagePicker().pickImage(source: source);
  }

  static Future<CroppedFile?> cropImage(File image) async {
    return await ImageCropper().cropImage(
      sourcePath: image.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop your photo to only include relevant text',
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Crop your photo to only include relevant text',
          aspectRatioLockEnabled: false,
        ),
      ],
    );
  }
}
