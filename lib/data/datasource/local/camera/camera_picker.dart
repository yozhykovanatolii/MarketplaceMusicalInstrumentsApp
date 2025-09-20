import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPicker {
  final _imagePicker = ImagePicker();

  Future<File> pickImageFileFromGallery() async {
    final status = await Permission.photos.request();
    if (!status.isGranted) throw Exception('Gallery permission was denied');
    return await getFileByImagePicker(ImageSource.gallery);
  }

  Future<File> getFileByImagePicker(ImageSource imageSource) async {
    final file = await _imagePicker.pickImage(source: imageSource);
    if (file == null) throw Exception('Photo was not selected');
    return File(file.path);
  }
}
