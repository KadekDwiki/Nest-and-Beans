import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:nest_and_beans/provider/home_provider.dart';

import 'package:nest_and_beans/Model/purchase.dart';
// import 'package:nest_and_beans/detail_purchase.dart';

class Review extends StatelessWidget {
  final Purchase purchase;

  const Review({required this.purchase, super.key});

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ulasan Produk',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: colorscheme.primary,

        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // review header
            Expanded(
              flex: 3,
              child: context.watch<HomeProvider>().imagePath == null
                  ? const Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.image, size: 100),
                    )
                  : _showImage(context),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => _onGalleryView(context),
                    child: const Text("Gallery"),
                  ),
                  ElevatedButton(
                    onPressed: () => _onCameraView(context),
                    child: const Text("Camera"),
                  ),
                  ElevatedButton(
                    onPressed: () => _onCustomCameraView(),
                    child: const Text("Custom Camera"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

onUpload() async {}

_onGalleryView(BuildContext context) async {
  final provider = context.read<HomeProvider>();

  /// todo-gallery-06: check if MacOS and Linux
  final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;
  final isLinux = defaultTargetPlatform == TargetPlatform.linux;
  if (isMacOS || isLinux) return;

  /// todo-gallery-01: initial ImagePicker class
  final picker = ImagePicker();

  /// todo-gallery-02: pick image from gallery
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  /// todo-gallery-03: check the result and update the image
  if (pickedFile != null) {
    /// todo-gallery-05: update the state, imagePath and imageFile
    provider.setImageFile(pickedFile);
    provider.setImagePath(pickedFile.path);
  }
}

_onCameraView(BuildContext context) async {
  final provider = context.read<HomeProvider>();

  /// todo-image-04: check if not Mobile
  final isAndroid = defaultTargetPlatform == TargetPlatform.android;
  final isiOS = defaultTargetPlatform == TargetPlatform.iOS;
  final isNotMobile = !(isAndroid || isiOS);
  if (isNotMobile) return;

  /// todo-image-01: initial ImagePicker class
  final picker = ImagePicker();

  /// todo-image-02: pick image from camera app
  final pickedFile = await picker.pickImage(source: ImageSource.camera);

  /// todo-image-03: check the result and update the image
  if (pickedFile != null) {
    provider.setImageFile(pickedFile);
    provider.setImagePath(pickedFile.path);
  }
}

_onCustomCameraView() async {}

Widget _showImage(BuildContext context) {
  /// todo-show-01: change widget to show the image
  final imagePath = context.read<HomeProvider>().imagePath;
  return kIsWeb
      ? Image.network(imagePath.toString(), fit: BoxFit.contain)
      : Image.file(File(imagePath.toString()), fit: BoxFit.contain);
}
