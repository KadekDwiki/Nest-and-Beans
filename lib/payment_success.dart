/* import 'package:flutter/material.dart';
import 'package:nest_and_beans/detail_orders.dart'; //detail pesanan
import '/Model/purchase.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final Purchase
  purchase; //variabel untuk menyimpan data pembelian yang diterima dari halaman sebelumnya

  const PaymentSuccessScreen({super.key, required this.purchase});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('OVO'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 100, color: Colors.green),
            const SizedBox(height: 10),
            const Text(
              'Berhasil',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            //tanggal sm waktu pembayaran diformat
            Text(
              _formatDate(purchase.purchaseDate),
              style: const TextStyle(color: Colors.black87, fontSize: 13),
            ),
            const SizedBox(height: 11),
            //menampilkan total harga dalam format rupiah
            Text(
              'Rp ${purchase.totalPrice.toStringAsFixed(0)}',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            const Text(
              'Merchant',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 5),
            Text(
              'Nest and Beans',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: colorscheme.primary,
              ),
            ),
            const SizedBox(height: 50),
              //Tombol Upload Bukti Pembayaran
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.upload),
                label: const Text("Upload Bukti Pembayaran"),
              ),

              const SizedBox(height: 10),

              //review Gambar
              if (_buktiBayar != null)
                Column(
                  children: [
                    const Text(
                      "Bukti pembayaran:",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 5),
                    Image.file(_buktiBayar!, width: 200),
                  ],
                ),

              const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailOrders(purchase: purchase),
                  ),
                );
              },
              child: const Text("Lihat Detail"),
            ),
          ],
        ),
      ),
    );
  }
}

//ngeformat tanggal bisa bagus
String _formatDate(DateTime date) {
  return '${_twoDigits(date.day)} ${_monthName(date.month)} ${date.year}, ${_twoDigits(date.hour)}:${_twoDigits(date.minute)}';
}

//biar angkanya isi 0 depannya ga 1 angka aja
String _twoDigits(int n) => n.toString().padLeft(2, '0');

//fungsinya buat mendapatkan nama bulan berdasarkan angka bulan
String _monthName(int month) {
  const monthNames = [
    '', //indeks 0 kosong karena bulan dimulai dari 1
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];
  return monthNames[month];
} */

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nest_and_beans/detail_orders.dart';
import '/Model/purchase.dart';

class PaymentSuccessScreen extends StatefulWidget {
  //ganti ke stateful
  final Purchase purchase;

  const PaymentSuccessScreen({super.key, required this.purchase});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  // Variabel untuk menyimpan file gambar yang diunggah dari galeri
  File? _buktiBayar;

  Future<void> _pickImage() async {
    // Membuat instance dari ImagePicker untuk memilih gambar
    final picker = ImagePicker();

    // Membuka galeri untuk memilih gambar
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    // Jika pengguna memilih gambar (tidak batal)
    if (pickedImage != null) {
      setState(() {
        // Menyimpan file gambar yang dipilih ke dalam variabel _buktiBayar
        _buktiBayar = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('OVO'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          // agar bisa discroll jika gambar besar
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, size: 100, color: Colors.green),
              const SizedBox(height: 10),
              const Text(
                'Berhasil',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _formatDate(widget.purchase.purchaseDate),
                style: const TextStyle(color: Colors.black87, fontSize: 13),
              ),
              const SizedBox(height: 11),
              Text(
                'Rp ${widget.purchase.totalPrice.toStringAsFixed(0)}',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              const Text(
                'Merchant',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 5),
              const Text(
                'Nest and Beans',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF185221),
                ),
              ),
              const SizedBox(height: 30),

              // Tombol upload dengan ikon upload dan label
              ElevatedButton.icon(
                onPressed:
                    _pickImage, // Ketika tombol ditekan, jalankan fungsi _pickImage
                icon: const Icon(Icons.upload), // Ikon upload di sebelah kiri
                label: const Text(
                  "Upload Bukti Pembayaran",
                ), // Teks pada tombol
              ),

              const SizedBox(height: 10),

              // Jika sudah ada gambar yang dipilih (tidak null)
              if (_buktiBayar != null)
                Column(
                  children: [
                    // Teks label "Bukti pembayaran"
                    const Text(
                      "Bukti pembayaran:",
                      style: TextStyle(fontSize: 14),
                    ),
                    // Spasi antara teks dan gambar
                    const SizedBox(height: 5),
                    // Menampilkan gambar yang telah dipilih user
                    Image.file(
                      _buktiBayar!, // Menggunakan tanda seru karena sudah dicek tidak null
                      width: 200, // Atur lebar gambar menjadi 200 piksel
                    ),
                  ],
                ),

              const SizedBox(height: 30),

              // 🔍 Tombol Lihat Detail
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailOrders(purchase: widget.purchase),
                    ),
                  );
                },
                child: const Text("Lihat Detail"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Format Tanggal
String _formatDate(DateTime date) {
  return '${_twoDigits(date.day)} ${_monthName(date.month)} ${date.year}, ${_twoDigits(date.hour)}:${_twoDigits(date.minute)}';
}

String _twoDigits(int n) => n.toString().padLeft(2, '0');

String _monthName(int month) {
  const monthNames = [
    '',
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];
  return monthNames[month];
}
