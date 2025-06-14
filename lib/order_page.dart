import 'package:flutter/material.dart';
import 'package:nest_and_beans/Model/purchase.dart';
import 'package:nest_and_beans/order_ready.dart';
import 'package:nest_and_beans/payment_method_page.dart';
import 'package:nest_and_beans/voucher_page.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Purchase purchaseItem = purchaseHistory[0];
    // Example purchase
    final colorscheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                color: Color.fromARGB(210, 236, 236, 236),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: colorscheme.primary,
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.local_mall,
                          color: colorscheme.primary,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pick Up',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Ambil pesanan ke toko',
                              style: TextStyle(
                                color: colorscheme.secondary,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _buildRoundedButton(context: context, text: 'Pilih'),
                    ],
                  ),
                ),
              ),

              // Order Summary Location Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade200, width: 4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ambil pesananmu di',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color.fromARGB(255, 215, 215, 215),
                            ),
                            child: Icon(
                              Icons.store,
                              color: colorscheme.primary,
                              size: 32,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pick Up',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(fontSize: 16),
                                    children: [
                                      TextSpan(
                                        text: '12.2 Km ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: colorscheme.primary,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'dari lokasi kamu',
                                        style: TextStyle(
                                          color: colorscheme.secondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Order Summary Detail Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                // Column to hold the order details
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row for Title and Add Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Detail Pesanan',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        _buildRoundedButton(context: context, text: 'Tambah'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Order Item Container
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        final purchase = purchaseHistory[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: ItemCard(
                            colorscheme: colorscheme,
                            purchase: purchase,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Eco-friendly Bag Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300, width: 4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Eco-friendly Bag',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Wajib untuk setiap pembelian yang dilakukan',
                              style: TextStyle(
                                color: colorscheme.secondary,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      MySwitch(),
                    ],
                  ),
                ),
              ),
              // Voucher Discount Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade200, width: 4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Diskon Belanja',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color.fromARGB(255, 215, 215, 215),
                            ),
                            child: Icon(
                              Icons.discount,
                              color: colorscheme.primary,
                              size: 32,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Gratis Ongkir',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Voucher gratis ongkir berhasil digunakan',
                                  style: TextStyle(
                                    color: colorscheme.secondary,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ChooseVoucherPage(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: colorscheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Payment Method Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade200, width: 4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Metode Pembayaran',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color.fromARGB(255, 215, 215, 215),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                'assets/images/ovo.png',
                                width: 32,
                                height: 32,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              'OVO',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ChoosePaymentMethod(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: colorscheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Order Subtotal Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade200, width: 4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildRowSubtotal('Subtotal Pesanan', 'Rp 500.000'),
                      _buildRowSubtotal(
                        'Diskon Toko',
                        '- Rp 10.000',
                        valueColor: Colors.red.shade300,
                      ),
                      _buildRowSubtotal('Biaya Layanan', 'Rp 5.000'),
                      _buildRowSubtotal('Biaya Pengemasan', 'Rp 5.000'),
                      _buildRowSubtotal(
                        'Biaya Pengiriman',
                        '-Rp 10.000',
                        valueColor: Colors.red.shade300,
                      ),
                      _buildRowSubtotal(
                        'Total',
                        'Rp 490.000',
                        valueColor: colorscheme.primary,
                        isBold: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => OrderReadyScreen(purchase: purchaseItem),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: colorscheme.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Text(
              'Lanjutkan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoundedButton({
    required BuildContext context,
    required String text,
  }) {
    final colorscheme = Theme.of(context).colorScheme;
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: colorscheme.primary,
        textStyle: TextStyle(fontSize: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: BorderSide(color: colorscheme.primary, width: 2),
        ),
      ),
      child: Text(text),
    );
  }

  Widget _buildRowSubtotal(
    String label,
    String value, {
    Color? valueColor,
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? Colors.black,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class MySwitch extends StatefulWidget {
  const MySwitch({super.key});

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.2, // Adjust the scale factor as needed
      child: Switch(
        value: isSwitched,
        onChanged: (value) {
          setState(() {
            isSwitched = value;
          });
        },
        activeColor: Colors.green,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.grey.shade300,
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.colorscheme,
    required this.purchase,
  });

  final ColorScheme colorscheme;
  final Purchase purchase;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row for Item Name and Image
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    purchase.product.name,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${purchase.selectedSize} - ${purchase.toppings[0]}',
                    style: TextStyle(
                      fontSize: 14,
                      color: colorscheme.secondary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 70,
                width: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    purchase.product.imageCover,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Row for Price and Quantity
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rp ${purchase.product.price.toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              QuantityOrder(colorscheme: colorscheme, qty: purchase.quantity),
            ],
          ),
        ],
      ),
    );
  }
}

class QuantityOrder extends StatefulWidget {
  const QuantityOrder({
    super.key,
    required this.colorscheme,
    required this.qty,
  });

  final ColorScheme colorscheme;
  final int qty;
  @override
  State<QuantityOrder> createState() => _QuantityOrderState();
}

class _QuantityOrderState extends State<QuantityOrder> {
  late int qty;

  @override
  void initState() {
    super.initState();
    qty = widget.qty; // Initialize qty with the value passed from the parent
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          color: widget.colorscheme.primary,
          iconSize: 24,
          icon: Icon(Icons.remove_circle_outline),
          onPressed: qty > 1
              ? () {
                  setState(() {
                    qty--;
                  });
                }
              : null, // Disable if qty is 1
        ),
        Text('$qty', style: TextStyle(fontSize: 16)),
        IconButton(
          color: widget.colorscheme.primary,
          iconSize: 24,
          icon: Icon(Icons.add_circle_outline),
          onPressed: () {
            setState(() {
              qty++;
            });
          },
        ),
      ],
    );
  }
}
