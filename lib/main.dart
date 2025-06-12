import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nest_and_beans/purchase_history.dart';
import 'product_detail.dart';

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
          primary: Color(0xFF185221),
          secondary: Color.fromRGBO(117, 117, 117, 0.7),
        ),
      ),
      // home: const MyHomePage(),
      home: const PurchaseHistory(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Nest & Beans')),
      body: Center(
        child: Text(
          'Hello Nest & Beans!',
          style: TextStyle(fontSize: 24, color: colorscheme.primary),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
