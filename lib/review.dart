import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:nest_and_beans/providers/review_provider.dart';
import 'package:nest_and_beans/Model/purchase.dart';
import 'package:nest_and_beans/product_detail.dart';

class Review extends StatefulWidget {
  final Purchase purchase;

  const Review({required this.purchase, super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  final _controller = TextEditingController();
  double _rating = 0;

  @override
  void dispose() {
    _controller.dispose(); // untuk menghindari memory leak
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    final imageFiles = context.watch<ReviewProvider>().imageFiles;

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
            // Heading review
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 15.0,
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Bagaimana minumanmu?",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Rating
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10.0,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RatingBar.builder(
                  initialRating: _rating,
                  minRating: 0.5,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 65.0,
                  itemBuilder: (context, _) =>
                      const Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _rating = rating;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Heading photo
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 15.0,
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Tambahkan Foto",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Photo upload
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

            const SizedBox(height: 10),

            // Button to upload photo
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: ElevatedButton.icon(
                onPressed: () => _showUploadOptions(context),
                icon: const Icon(Icons.upload),
                label: const Text("Upload Gambar"),
              ),
            ),

            const SizedBox(height: 16),

            // Review text
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 15.0,
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Berikan Ulasanmu",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Text Input
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _controller,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Tulis ulasan...',
                  alignLabelWithHint:
                      true, // label tetap di atas untuk multi-line
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 15.0,
              ),
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _submitReview,
                // icon: const Icon(Icons.send, color: Colors.white),
                label: const Text(
                  "Kirim Ulasan",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
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
      context.read<ReviewProvider>().addImage(picked);
    }
  }

  void _onCameraView() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.camera);
    if (picked != null) {
      context.read<ReviewProvider>().addImage(picked);
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
              // Tutup AlertDialog
              Navigator.of(context, rootNavigator: true).pop();

              // Kembali ke halaman sebelumnya
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetail(product: widget.purchase.product),
                ),
              );

              // Bersihkan state
              context.read<ReviewProvider>().clearImages();
              _controller.clear();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
