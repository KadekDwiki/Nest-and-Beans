// home_provider.dart
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ReviewProvider extends ChangeNotifier {
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
