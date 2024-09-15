import 'dart:io';

import 'package:camera/camera.dart';
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

  static Future<void>setupCameraController(CameraController cameraController,List<CameraDescription>camerasDescription )async{
    List<CameraDescription>cameras = await availableCameras();
    if(cameras.isNotEmpty){
      camerasDescription = cameras;
      cameraController = CameraController(cameras.first, ResolutionPreset.high);

      cameraController?.initialize().then((_){
        
      });
    }

  }

}