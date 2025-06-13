import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nest_and_beans/Pages/pemesanan.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nest_and_beans/Model/product.dart';
import 'package:nest_and_beans/purchase_history.dart';
import 'product_detail.dart';
import 'payment_success.dart';
//import 'package:nest_and_beans/purchase_history.dart';
//import 'product_detail.dart';
//import 'payment_success.dart';
//import 'order_ready.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
        colorScheme: ColorScheme.light(
          primary: Color.fromARGB(255, 33, 133, 48),
          secondary: Color.fromRGBO(80, 80, 80, 0.907),
        ),
      ),
      // home: const MyHomePage(),
      //home: const PurchaseHistory(),
      //home: const PaymentSuccessScreen(),
      //home:  ProductDetail(product: productLists[1]),
      // home: const MyHomePage(),
      //home: const PurchaseHistory(),
      //home: const PaymentSuccessScreen(),
      //home:  ProductDetail(product: productLists[0]),
      home: const Pemesanan(),
    );
  }
}
