import 'package:flutter/material.dart';
import 'model/purchase.dart';
import 'payment_method_page.dart';
import 'payment_success.dart';
import 'voucher_page.dart';
import 'package:provider/provider.dart';
import 'model/product.dart';
import 'model/cart_item.dart';
import 'providers/cart_provider.dart';
import 'utils/payment_mapper.dart';
import 'homepage.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  double _estimateDiscountFromCode(String code, double subtotal) {
    final normalized = code.toLowerCase();
    if (normalized.contains('gratis') || normalized.contains('ongkir')) {
      // misalnya 10rb
      return 10000;
    }
    // default 20rb
    return 20000;
  }

  String _paymentLabel(AppPaymentMethod method) {
    switch (method) {
      case AppPaymentMethod.qris:
        return 'QRIS';
      case AppPaymentMethod.ovo:
        return 'OVO';
      case AppPaymentMethod.dana:
        return 'Dana';
      case AppPaymentMethod.shopeepay:
        return 'ShopeePay';
      case AppPaymentMethod.cash:
        return 'Cash';
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    final cart = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
                                  'Toko Nest & Beans Jimbaran',
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
                        _buildRoundedButton(
                          context: context,
                          text: 'Tambah',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const HomePage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    if (cart.items.isEmpty)
                      const Text('Keranjang kosong.')
                    else
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cart.items.length,
                        itemBuilder: (context, index) {
                          final item = cart.items[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: CartItemCard(
                              colorscheme: colorscheme,
                              item: item,
                              onQtyChanged: (newQty) {
                                context.read<CartProvider>().updateQty(
                                  item,
                                  newQty,
                                );
                              },
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
                                  cart.voucher?.code ??
                                      'Tidak ada voucher dipilih',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  cart.voucher == null
                                      ? 'Pilih voucher untuk diskon'
                                      : 'Diskon: Rp ${cart.voucher!.discountAmount.toStringAsFixed(0)}',
                                  style: TextStyle(
                                    color: colorscheme.secondary,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              final result = await Navigator.push<String>(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ChooseVoucherPage(),
                                ),
                              );

                              if (result != null) {
                                // contoh: hitung diskon sederhana berdasarkan kode
                                final cart = context.read<CartProvider>();
                                final discount = _estimateDiscountFromCode(
                                  result,
                                  cart.subtotal,
                                );

                                cart.applyVoucher(
                                  AppVoucher(
                                    code: result,
                                    discountAmount: discount,
                                  ),
                                );
                              }
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
                                'assets/images/pay.png',
                                width: 32,
                                height: 32,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              cart.payment != null
                                  ? _paymentLabel(cart.payment!)
                                  : 'Belum dipilih',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              final currentMethod =
                                  context.read<CartProvider>().payment?.name ??
                                  'QRIS';
                              final result = await Navigator.push<String>(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ChoosePaymentMethod(
                                    initialMethod: currentMethod,
                                  ),
                                ),
                              );

                              if (result != null) {
                                final mappedMethod = PaymentMapper.fromString(
                                  result,
                                );
                                context.read<CartProvider>().selectPayment(
                                  mappedMethod,
                                );
                              }
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
                      _buildRowSubtotal(
                        'Subtotal Pesanan',
                        'Rp ${cart.subtotal.toStringAsFixed(0)}',
                      ),
                      _buildRowSubtotal('Biaya Layanan', 'Rp 3.000'),
                      _buildRowSubtotal('Biaya Pengemasan', 'Rp 7.000'),
                      _buildRowSubtotal(
                        'Total Diskon',
                        'Rp ${cart.discount.toStringAsFixed(0)}',
                        valueColor: Colors.red.shade300,
                      ),
                      _buildRowSubtotal(
                        'Total',
                        'Rp ${cart.total.toStringAsFixed(0)}',
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
            onPressed: cart.items.isEmpty
                ? null
                : () {
                    // Di tahap awal kita skip validasi payment/voucher
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PaymentSuccessScreen(
                          // sementara kirim item pertama saja atau buat mock Purchase
                          purchase: _cartToPurchase(cart),
                        ),
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
            child: const Text(
              'Lanjutkan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Purchase _cartToPurchase(CartProvider cart) {
    // Ambil item pertama sebagai contoh; nanti ganti order object sebenarnya
    final first = cart.items.first;
    return Purchase(
      id: 'temp-${DateTime.now().millisecondsSinceEpoch}',
      product: first.product,
      selectedSize: first.size,
      quantity: first.qty,
      toppings: first.toppings,
      totalPrice: cart.total,
      paymentMethod: PurchasePaymentMapper.fromAppPayment(
        cart.payment ?? AppPaymentMethod.qris,
      ),
      purchaseDate: DateTime.now(),
      status: PurchaseStatus.berhasil,
    );
  }

  Widget _buildRoundedButton({
    required BuildContext context,
    required String text,
    VoidCallback? onTap,
  }) {
    final colorscheme = Theme.of(context).colorScheme;
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: colorscheme.primary,
        textStyle: const TextStyle(fontSize: 16),
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

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.colorscheme,
    required this.item,
    required this.onQtyChanged,
  });

  final ColorScheme colorscheme;
  final CartItem item;
  final ValueChanged<int> onQtyChanged;

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
          // Nama + Gambar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_nameAndOptions(context), _imageThumb()],
          ),
          const SizedBox(height: 8),
          // Harga + Qty
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rp ${item.product.price.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _QtyControl(
                colorscheme: colorscheme,
                initial: item.qty,
                onChanged: onQtyChanged,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _nameAndOptions(BuildContext context) {
    final toppingPreview = item.toppings.isEmpty
        ? '-'
        : item.toppings.join(', ');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.product.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          '${item.size} - $toppingPreview',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }

  Widget _imageThumb() => SizedBox(
    height: 70,
    width: 70,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(item.product.imageCover, fit: BoxFit.cover),
    ),
  );
}

class _QtyControl extends StatefulWidget {
  const _QtyControl({
    required this.colorscheme,
    required this.initial,
    required this.onChanged,
  });

  final ColorScheme colorscheme;
  final int initial;
  final ValueChanged<int> onChanged;

  @override
  State<_QtyControl> createState() => _QtyControlState();
}

class _QtyControlState extends State<_QtyControl> {
  late int qty;

  @override
  void initState() {
    super.initState();
    qty = widget.initial;
  }

  void _update(int newQty) {
    setState(() => qty = newQty);
    widget.onChanged(newQty);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          color: widget.colorscheme.primary,
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: qty > 1 ? () => _update(qty - 1) : null,
        ),
        Text('$qty', style: const TextStyle(fontSize: 16)),
        IconButton(
          color: widget.colorscheme.primary,
          icon: const Icon(Icons.add_circle_outline),
          onPressed: () => _update(qty + 1),
        ),
      ],
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

class _VoucherSummarySection extends StatelessWidget {
  const _VoucherSummarySection({required this.colorscheme});
  final ColorScheme colorscheme;

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final v = cart.voucher;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 4),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(Icons.discount, color: colorscheme.primary, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              v == null ? 'Tidak ada voucher' : 'Voucher ${v.code} terpasang',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChooseVoucherPage()),
              );
            },
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: colorscheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentSummarySection extends StatelessWidget {
  const _PaymentSummarySection({required this.colorscheme});
  final ColorScheme colorscheme;

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final p = cart.payment;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 4),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(Icons.payment, color: colorscheme.primary, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              p == null ? 'Belum pilih pembayaran' : p.name.toUpperCase(),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            onPressed: () async {
              final currentMethod =
                  context.read<CartProvider>().payment?.name ?? 'QRIS';
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      ChoosePaymentMethod(initialMethod: currentMethod),
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
    );
  }
}

class _OrderSummaryTotals extends StatelessWidget {
  const _OrderSummaryTotals({required this.colorscheme});
  final ColorScheme colorscheme;

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _row('Subtotal Pesanan', _rp(cart.subtotal)),
          _row(
            'Diskon',
            '-${_rp(cart.discount)}',
            valueColor: Colors.red.shade300,
          ),
          _row('Biaya Layanan', _rp(0)), // nanti
          _row('Biaya Pengemasan', _rp(0)), // nanti
          const Divider(),
          _row(
            'Total',
            _rp(cart.total),
            valueColor: colorscheme.primary,
            isBold: true,
          ),
        ],
      ),
    );
  }

  Widget _row(
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

  String _rp(double v) => 'Rp ${v.toStringAsFixed(0)}';
}
