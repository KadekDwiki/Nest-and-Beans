import 'package:flutter/material.dart';

class ChooseVoucherPage extends StatefulWidget {
  const ChooseVoucherPage({super.key});

  @override
  State<ChooseVoucherPage> createState() => _ChooseVoucherPageState();
}

class _ChooseVoucherPageState extends State<ChooseVoucherPage> {
  String selectedVoucher = 'Gratis Ongkir';

  final List<Map<String, dynamic>> voucherOngkir = [
    {
      'name': 'Gratis Ongkir',
      'icon': 'assets/images/gratis_ongkir.png',
      'desc': 'Min. Blj Rp50RB',
      'validUntil': 'Berlaku hingga 31 Desember 2026',
    },
    {
      'name': 'Gratis Ongkir Extra',
      'icon': 'assets/images/gratis_ongkir.png',
      'desc': 'Min. Blj Rp100RB',
      'validUntil': 'Berlaku hingga 31 Juli 2025',
    },
  ];

  final List<Map<String, dynamic>> voucherShop = [
    {
      'name': 'Cashback 20% s/d 50RB',
      'icon': 'assets/images/voucher.png',
      'desc': 'Min. Blj Rp50RB',
      'validUntil': 'Berlaku hingga 31 Desember 2026',
    },
    {
      'name': 'Diskon 99%',
      'icon': 'assets/images/voucher.png',
      'desc': 'Min. Blj Rp100RB',
      'validUntil': 'Berlaku hingga 31 Juli 2025',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pilih Voucher',
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
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              'Voucher Gratis Ongkir',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: voucherOngkir.length,
              itemBuilder: (context, index) {
                final voucher = voucherOngkir[index];
                return buildVoucherOption(voucher);
              },
              separatorBuilder: (context, index) =>
                  Divider(color: Colors.grey.shade300, thickness: 1, height: 1),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey.shade300, width: 4),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text(
                'Voucher Toko',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: voucherShop.length,
              itemBuilder: (context, index) {
                final voucher = voucherShop[index];
                return buildVoucherOption(voucher);
              },
              separatorBuilder: (context, index) =>
                  Divider(color: Colors.grey.shade300, thickness: 1, height: 1),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildVoucherOption(Map<String, dynamic> method) {
    return RadioListTile<String>(
      controlAffinity: ListTileControlAffinity.trailing,
      value: method['name'],
      groupValue: selectedVoucher,
      onChanged: (value) {
        setState(() {
          selectedVoucher = value!;
        });
        Navigator.pop(context, selectedVoucher);
      },
      title: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              method['icon'],
              width: 82,
              height: 62,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(method['name'])),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(method['desc'], style: TextStyle(color: Colors.grey.shade700)),
            Text(
              method['validUntil'],
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}
