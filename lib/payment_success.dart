import 'package:flutter/material.dart';
import 'order_ready.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

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
            const Text(
              '29 Februari 2025, 19:38',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            const Text(
              'Rp 28.000',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
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
                  MaterialPageRoute(builder: (_) => const OrderReadyScreen()), //ganti pake punya pyari nanti
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
