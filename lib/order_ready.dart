import 'package:flutter/material.dart';
import 'purchase_history.dart';
import '/Model/purchase.dart';

class OrderReadyScreen extends StatelessWidget {
  final Purchase purchase;

  const OrderReadyScreen({super.key, required this.purchase});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pesanan Siap"),
        centerTitle: true,
        backgroundColor: Color(0xFF185221),
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'ORDER ID : #${purchase.id}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF185221),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Status: Siap diambil',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.info, color: Color(0xFF185221)),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Pesananmu siap diambil. Scan QR untuk mengambil pesananmu!',
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: Image.asset(
                            'assets/images/qrcode.png',
                            width: 200,
                            height: 200,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'PESANAN PILIHANMU',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  purchase.product.imageCover,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(purchase.product.name),
              subtitle: Text(
                'Size: ${purchase.selectedSize}'
                '${purchase.product.toppings.isNotEmpty ? " | ${purchase.product.toppings.join(', ')}" : ""}',
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Penyelesaian sedang diproses',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF185221),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Pesanan akan segera diselesaikan',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PurchaseHistory(),
                        ),
                      );
                    },
                    child: const Text("Selesaikan Pesanan"),
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
