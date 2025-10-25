import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:marketplace_musical_instruments_app/core/exception/permission_denied_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/photo_not_selected_exception.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPickerService {
  static final _imagePicker = ImagePicker();

  static Future<File> pickImageFileFromGallery() async {
    final status = await Permission.photos.request();
    if (!status.isGranted) {
      throw PermissionDeniedException('Gallery permission was denied');
    }
    return await _getFileByImagePicker(ImageSource.gallery);
  }

  static Future<File> _getFileByImagePicker(ImageSource imageSource) async {
    final file = await _imagePicker.pickImage(source: imageSource);
    if (file == null) {
      throw PhotoNotSelectedException('Photo was not selected');
    }
    return File(file.path);
  }
}
