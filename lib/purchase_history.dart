import 'package:flutter/material.dart';
import '/Model/purchase.dart';
import 'detail_purchase.dart';

class PurchaseHistory extends StatelessWidget {
  const PurchaseHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF185221),
        centerTitle: true,
        title: const Text(
          'Riwayat Pemesanan',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: ListView.builder(
        itemCount: purchaseHistory.length,
        itemBuilder: (context, index) {
          final purchase = purchaseHistory[index];

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status & Lihat Detail
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      purchase.status.name.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: getStatusColor(purchase.status),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailPurchase(purchase: purchase),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Text(
                            "Lihat Detail",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF185221),
                            ),
                          ),

                          SizedBox(width: 4),

                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: Color(0xFF185221),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // Lokasi & Tanggal
                Text(
                  purchase.location,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  _formatDate(purchase.purchaseDate),
                  style: const TextStyle(color: Colors.black87, fontSize: 13),
                ),
                const SizedBox(height: 6),

                // Produk
                Text('${purchase.quantity} ${purchase.product.name}'),

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
                        backgroundColor: Color(0xFF185221),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                      ),
                      onPressed: () {
                        // Aksi
                      },
                      child: const Text(
                        'PESAN LAGI',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

Color getStatusColor(PurchaseStatus status) {
  switch (status) {
    case PurchaseStatus.berhasil:
      return Color(0xFF185221);
    case PurchaseStatus.gagal:
      return Colors.red;
    case PurchaseStatus.pending:
      return Color.fromRGBO(117, 117, 117, 0.7);
  }
}

// Fungsi format tanggal
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
