import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'login.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 700;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/splash_screen.jpg', fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment:
                  isWide ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              
              children: [
                const Text(
                  'Nest and Beans, Teman Kalcer Terbaikmu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                const SizedBox(height: 8),
                Text(
                  'Hangatkan harimu dengan memesan kopi di Nest and Beans',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: isWide ? TextAlign.center : TextAlign.start,
                ),
                
                const SizedBox(height: 32),
                SizedBox(
                  width: isWide ? 300 : double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: const Text(
                      'Mulai Sekarang',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}