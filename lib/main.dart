import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'package:nest_and_beans/provider/home_provider.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:nest_and_beans/Model/product.dart';
import 'package:nest_and_beans/splash_screen.dart';
// import 'package:nest_and_beans/product_detail.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
  );
  runApp(MyApp());
  // runApp(
  //   ChangeNotifierProvider(
  //     create: (context) => HomeProvider(),
  //     child: const MaterialApp(home: MyApp()),
  //   ),
  // );
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
      home: const SplashScreen(),
      // home: ProductDetail(product: productLists[0]),
    );
  }
}
