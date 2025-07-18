// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart' show XFile;

// class HomeProvider extends ChangeNotifier {
//   String? imagePath;

//   /// todo-gallery-04: create a image variable so save image information
//   XFile? imageFile;

//   void setImagePath(String? value) {
//     imagePath = value;
//     notifyListeners();
//   }

//   /// todo-gallery-04-02: create a function to save a value
//   void setImageFile(XFile? value) {
//     imageFile = value;
//     notifyListeners();
//   }
// }

// home_provider.dart
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class HomeProvider extends ChangeNotifier {
  List<File> _imageFiles = [];

  List<File> get imageFiles => _imageFiles;

  void addImage(XFile file) {
    _imageFiles.add(File(file.path));
    notifyListeners();
  }

  void clearImages() {
    _imageFiles.clear();
    notifyListeners();
  }
}
