import 'package:flutter/material.dart';
import '/Model/product.dart';

class OrderReadyScreen extends StatelessWidget {
  const OrderReadyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final caramelLatte = productLists.firstWhere(
      (product) => product.name == 'Caramel Latte',
    );
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
                  const Text(
                    'ORDER ID : #240712690493',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF185221),
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
                  caramelLatte.imageCover,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(caramelLatte.name),
              subtitle: Text(
                '${caramelLatte.sizes.join(', ')}'
                '${caramelLatte.toppings.isNotEmpty ? " | ${caramelLatte.toppings.join(', ')}" : ""}',
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
                          builder: (_) => const OrderReadyScreen(), //ganti pake punya pyari
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
