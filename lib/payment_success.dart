import 'package:flutter/material.dart';
import 'package:nest_and_beans/detail_orders.dart';
import '/Model/purchase.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final Purchase purchase;

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
            Text(
              _formatDate(purchase.purchaseDate),
              style: const TextStyle(color: Colors.black87, fontSize: 13),
            ),
            const SizedBox(height: 6),
            const SizedBox(height: 5),
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
            const Text(
              'Nest and Beans',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF185221),
              ),
            ),
            const SizedBox(height: 50),
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
