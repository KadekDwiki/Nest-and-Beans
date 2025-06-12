import 'package:flutter/material.dart';
import 'Model/purchase.dart';

class PurchaseHistory extends StatelessWidget {
  const PurchaseHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Pemesanan'), centerTitle: true),

      body: ListView.builder(
        itemCount: purchaseHistory.length,
        itemBuilder: (context, index) {
          final purchase = purchaseHistory[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status & Lihat Detail
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        purchase.status == PurchaseStatus.success
                            ? "BERHASIL"
                            : purchase.status.name.toUpperCase(),
                        style: TextStyle(
                          color: purchase.status == PurchaseStatus.success
                              ? Colors.green
                              : purchase.status == PurchaseStatus.failed
                              ? Colors.red
                              : Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: const [
                          Text("Lihat Detail", style: TextStyle(fontSize: 12)),
                          Icon(Icons.arrow_forward_ios, size: 12),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Lokasi dummy & Tanggal
                  const Text(
                    "Jimbaran, Bali",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    _formatDate(purchase.purchaseDate),
                    style: const TextStyle(color: Colors.black87, fontSize: 13),
                  ),

                  const SizedBox(height: 6),

                  // Produk dan topping
                  Text(
                    '${purchase.quantity} ${purchase.product.name}'
                    '${purchase.selectedToppings.isNotEmpty ? ", " + purchase.selectedToppings.join(", ") : ""}',
                  ),

                  const SizedBox(height: 4),

                  // Pemesanan via aplikasi
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Pemesanan Via Aplikasi",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Icon(Icons.phone_android, size: 16, color: Colors.grey),
                    ],
                  ),

                  const Divider(height: 20),

                  // Total & Tombol Pesan Lagi
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${purchase.quantity} item • Rp ${purchase.totalPrice.toStringAsFixed(0)}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'PESAN LAGI',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
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
