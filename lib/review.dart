// import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:nest_and_beans/provider/home_provider.dart';
import 'package:nest_and_beans/Model/purchase.dart';

class Review extends StatefulWidget {
  final Purchase purchase;

  const Review({required this.purchase, super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose(); // untuk menghindari memory leak
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    final imageFiles = context.watch<HomeProvider>().imageFiles;

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
            ElevatedButton.icon(
              onPressed: () => _showUploadOptions(context),
              icon: const Icon(Icons.upload),
              label: const Text("Upload Gambar"),
            ),

            const SizedBox(height: 16),

            if (imageFiles.isNotEmpty)
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: imageFiles
                    .map(
                      (file) => Image.file(
                        file,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    )
                    .toList(),
              ),

            const SizedBox(height: 24),

            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Tulis ulasan...',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _submitReview,
              child: const Text("Kirim Ulasan"),
            ),
          ],
        ),
      ),
    );
  }

  void _showUploadOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("Galeri"),
              onTap: () {
                Navigator.pop(context);
                _onGalleryView();
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text("Ambil Gambar"),
              onTap: () {
                Navigator.pop(context);
                _onCameraView();
              },
            ),
          ],
        );
      },
    );
  }

  void _onGalleryView() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      context.read<HomeProvider>().addImage(picked);
    }
  }

  void _onCameraView() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.camera);
    if (picked != null) {
      context.read<HomeProvider>().addImage(picked);
    }
  }

  void _submitReview() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Berhasil"),
        content: const Text("Ulasan berhasil ditambahkan!"),
        actions: [
          TextButton(
            onPressed: () {
              // 1. Tutup AlertDialog
              Navigator.of(context, rootNavigator: true).pop();

              // 2. Kembali ke halaman sebelumnya
              Navigator.pop(context);

              // 3. Bersihkan state
              context.read<HomeProvider>().clearImages();
              _controller.clear();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
