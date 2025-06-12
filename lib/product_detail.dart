import 'package:flutter/material.dart';
import 'package:nest_and_beans/Model/product.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  product.imageCover,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                product.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                product.category,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(product.description),
              const SizedBox(height: 16),
              Text('Harga: Rp${product.price.toStringAsFixed(0)}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Text('Pilih Ukuran:', style: const TextStyle(fontWeight: FontWeight.bold)),
              Column(
                children: product.sizes.map((size) {
                  return Row(
                    children: [
                      Radio<String>(
                        value: size,
                        groupValue: selectedSize,
                        onChanged: (value) {
                          setState(() {
                            selectedSize = value!;
                          });
                        },
                      ),
                      Text(size),
                    ],
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              if (!product.isAvailable)
                const Text('Tidak tersedia saat ini',
                    style: TextStyle(color: Colors.red)),
              if (product.isAvailable)
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // aksi beli
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF185221),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                    ),
                    child: const Text('Beli Sekarang'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
