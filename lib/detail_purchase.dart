import 'package:flutter/material.dart';
import '/Model/purchase.dart';

class DetailPurchase extends StatelessWidget {
  final Purchase purchase;

  const DetailPurchase({required this.purchase, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Pembelian',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF185221),

        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              purchase.status.name.toUpperCase(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: getStatusColor(purchase.status),
              ),
            ),

            const SizedBox(height: 4),

            Divider(color: getStatusColor(purchase.status), thickness: 2),
            const SizedBox(height: 4),

            Text(
              'ORDER ID : #${purchase.id}',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF185221),
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 24),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    purchase.product.imageCover,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        purchase.product.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${purchase.selectedSize} Size, ${purchase.product.description}',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF185221),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Text(
                    '${purchase.quantity}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Harga', style: TextStyle(fontSize: 15)),
                Text(
                  'Rp ${purchase.totalPrice.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(height: 32),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Total Pembayaran',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),

            const SizedBox(height: 4),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Rp ${purchase.totalPrice.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF185221),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Color getStatusColor(PurchaseStatus status) {
  switch (status) {
    case PurchaseStatus.berhasil:
      return const Color(0xFF185221);
    case PurchaseStatus.gagal:
      return Colors.red;
    case PurchaseStatus.pending:
      return const Color.fromRGBO(117, 117, 117, 0.7);
  }
}
