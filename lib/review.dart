import 'package:flutter/material.dart';
import 'package:nest_and_beans/Model/purchase.dart';
// import 'package:nest_and_beans/detail_purchase.dart';

class Review extends StatelessWidget {
  final Purchase purchase;

  const Review({required this.purchase, super.key});

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ulasan Produk',
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
            // review header
          ],
        ),
      ),
    );
  }
}
