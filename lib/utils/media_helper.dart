import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Helper{
 static Future<File?> pickGalleryPhoto(
      ImageSource source, ImagePicker imagePicker) async {
    XFile? _pickedFile = await imagePicker.pickImage(
      source: source,
      imageQuality: 40,
    );
    return File(_pickedFile!.path);
  }

  

}