import 'package:flutter/material.dart';

class ChoosePaymentMethod extends StatefulWidget {
  const ChoosePaymentMethod({super.key});

  @override
  State<ChoosePaymentMethod> createState() => _ChoosePaymentMethodState();
}

class _ChoosePaymentMethodState extends State<ChoosePaymentMethod> {
  String selectedMethod = 'QRIS';

  final List<Map<String, dynamic>> connectedPayments = [
    {'name': 'QRIS', 'icon': 'assets/images/qris.png'},
    {
      'name': 'Kartu Kredit',
      'icon': 'assets/images/credit_card.png',
      'desc':
          'Minimal pembayaran Rp 10.000 dan mendukung Kartu Berlogo Visa, Mastercard dan JCB',
    },
    {
      'name': 'Dana',
      'icon': 'assets/images/dana.png',
      'saldo': 'Rp 2.615',
      'saldoColor': Colors.red,
    },
    {
      'name': 'ShopeePay',
      'icon': 'assets/images/shopeepay.png',
      'saldo': 'Rp 468',
      'saldoColor': Colors.red,
    },
    {
      'name': 'OVO',
      'icon': 'assets/images/ovo.png',
      'saldo': 'Rp 0',
      'saldoColor': Colors.red,
    },
  ];

  final List<Map<String, dynamic>> otherPayments = [
    {
      'name': 'Gopay',
      'icon': 'assets/images/gopay.png',
      'action': 'Aktifkan Sekarang',
    },
    {
      'name': 'blu',
      'icon': 'assets/images/blu.png',
      'action': 'Aktifkan Sekarang',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pilih Pembayaran',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Pembayaran Terhubung',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                ...connectedPayments.map(
                  (method) => buildPaymentOption(method),
                ),
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey.shade300, width: 4),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Metode Pembayaran Lainnya',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                ...otherPayments.map((method) => buildOtherPayment(method)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPaymentOption(Map<String, dynamic> method) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: RadioListTile<String>(
        controlAffinity: ListTileControlAffinity.trailing,
        value: method['name'],
        groupValue: selectedMethod,
        onChanged: (value) {
          setState(() {
            selectedMethod = value!;
          });
        },
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                method['icon'],
                width: 32,
                height: 32,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Text(method['name']),
          ],
        ),
        subtitle: method['desc'] != null
            ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  method['desc'],
                  style: const TextStyle(color: Colors.green),
                ),
              )
            : method['saldo'] != null
            ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Saldo: ${method['saldo']}',
                  style: TextStyle(color: method['saldoColor']),
                ),
              )
            : null,
      ),
    );
  }

  Widget buildOtherPayment(Map<String, dynamic> method) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            method['icon'],
            width: 32,
            height: 32,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(method['name']),
        trailing: Text(
          method['action'],
          style: const TextStyle(color: Colors.green, fontSize: 14),
        ),
        onTap: () {},
      ),
    );
  }
}
