import 'package:flutter/material.dart';
import 'package:nest_and_beans/model/purchase.dart';
import 'package:nest_and_beans/order_ready.dart';

class DetailOrders extends StatelessWidget {
  final Purchase purchase;

  const DetailOrders({required this.purchase, super.key});

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Pemesanan',
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
              style: TextStyle(
                fontSize: 14,
                color: colorscheme.primary,
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
                        'Size: ${purchase.selectedSize}',
                        style: const TextStyle(fontSize: 13),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Topping: ${purchase.toppings}',
                        style: const TextStyle(fontSize: 12),
                      ),

                      const SizedBox(height: 2),
                      Text(
                        purchase.product.description,
                        style: const TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const Divider(height: 32),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                purchase.paymentMethod.name.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: getPaymentColor(purchase.paymentMethod),
                ),
              ),
            ),

            const Divider(height: 32),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Harga',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${purchase.quantity}x    Rp ${purchase.product.price.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(height: 32),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Pembayaran',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Rp ${purchase.totalPrice.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: colorscheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colorscheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderReadyScreen(purchase: purchase),
                  ),
                );
              },
              child: const Text(
                'AMBIL SEKARANG',
                style: TextStyle(color: Colors.white),
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
      return const Color.fromARGB(255, 33, 133, 48);
    case PurchaseStatus.gagal:
      return Colors.red;
    case PurchaseStatus.pending:
      return const Color.fromRGBO(117, 117, 117, 0.7);
  }
}

Color getPaymentColor(PaymentMethod paymentMethod) {
  switch (paymentMethod) {
    case PaymentMethod.qris:
      return Colors.black;
    case PaymentMethod.ovo:
      return Colors.purple;
    case PaymentMethod.dana:
      return Colors.blueAccent;
  }
}
