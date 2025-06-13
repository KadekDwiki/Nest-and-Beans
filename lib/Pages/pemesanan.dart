import 'package:flutter/material.dart';

class Pemesanan extends StatelessWidget {
  const Pemesanan({super.key});

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Pemesanan')),
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
                        width: 60,
                        height: 60,
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
                          size: 42,
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
                                fontSize: 20,
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
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ambil pesananmu di',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
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
                                  fontSize: 20,
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

              // Order Summary Detail Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Detail Pesanan',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        _buildRoundedButton(context: context, text: 'Tambah'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
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
        textStyle: TextStyle(fontSize: 20),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: BorderSide(color: colorscheme.primary, width: 2),
        ),
      ),
      child: Text(text),
    );
  }
}
