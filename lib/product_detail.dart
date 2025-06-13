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
  int quantity = 1;
  List<String> selectedToppings = [];

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final double totalPrice = product.price * quantity;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Produk',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color(0xFF185221),
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar produk
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  product.imageCover,
                  height: 550,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Nama dan deskripsi
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              product.description,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            // Harga
            Text(
              'Rp ${product.price.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Divider(height: 10, color: Colors.grey),
            const SizedBox(height: 20),

            // Pilihan ukuran
            const Text(
              'Pilih Ukuran Cup:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: product.sizes.map((size) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
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
                    const SizedBox(width: 50), // Jarak antar pilihan
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Pilihan ukuran
            const Text(
              'Pilih Topping:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: product.toppings.map((topping) {
                return CheckboxListTile(
                  title: Text(topping),
                  value: selectedToppings.contains(topping),
                  onChanged: (bool? isChecked) {
                    setState(() {
                      if (isChecked == true) {
                        selectedToppings.add(topping);
                      } else {
                        selectedToppings.remove(topping);
                      }
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                );
              }).toList(),
            ),

            // Notifikasi jika tidak tersedia
            if (!product.isAvailable)
              const Text(
                'Tidak tersedia saat ini',
                style: TextStyle(color: Colors.red),
              ),

            const SizedBox(
              height: 80,
            ), // Untuk memberi jarak agar tombol tidak tertutup
          ],
        ),
      ),

      // Tombol beli di bawah
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey.shade300)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Tombol + -
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                  ),
                  Text('$quantity', style: const TextStyle(fontSize: 16)),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                  ),
                ],
              ),

              // Tombol beli
              ElevatedButton(
                onPressed: selectedSize == null || !product.isAvailable
                    ? null
                    : () {
                        // aksi beli atau tambah ke keranjang
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF185221),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 12,
                  ),
                ),
                child: Text(
                  'Tambah - Rp ${totalPrice.toStringAsFixed(0)}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
