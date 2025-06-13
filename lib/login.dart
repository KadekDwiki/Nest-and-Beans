import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'splash_screen.dart';
import 'register.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;

  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //validasi email
  bool isValidGmail(String email) {
    final regex = RegExp(r'^([a-zA-Z0-9._%+-]+@gmail\.com|\d{10,13})$');
    return regex.hasMatch(email);
  }

  //validasi password
  bool isValidPassword(String password) {
    final regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    return regex.hasMatch(password);
  }

  //logic validasi email dan password
  void _handleLogin() {
    String name = _emailController.text;
    String password = _passwordController.text;

    if (name.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Email / Nomor Telepon dan password tidak boleh kosong")),
      );
      return;
    }else if (!isValidGmail(name)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Email / Nomor Telepon tidak valid")),
      );
      return;
    }else if (!isValidPassword(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password minimal 8 karakter mengandung huruf dan angka")),
      );
      return;
    }

    // Jika semua validasi lolos
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: IconButton(
                      iconSize: 30,
                        icon: Icon(
                          CupertinoIcons.chevron_left_circle,
                          color: Theme.of(context).colorScheme.primary
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => SplashScreen()),
                          );
                        },
                      ),
                    ),
                  ),

                  //Selamat Datang
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Text(
                        "Selamat Datang",
                        style: TextStyle(
                          fontSize: 27, fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                    ) 
                  ),

                  //Silahkan masuk ke akun Nest and Beans mu
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 52),
                      child: Text(
                        "Silahkan masuk ke akun Nest and Beans mu",
                        style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.primary),
                      ),
                    ) 
                  ),

                  SizedBox(height: 50),

                  //E-mail / Nomor Telepon
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, bottom: 5),
                      child: Text(
                        "E-mail / Nomor Telepon",
                        style: TextStyle(
                          fontSize: 18, 
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                    ) 
                  ),

                  SizedBox(
                    height: 45,
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email / Nomor Telepon',
                        filled: true,
                        fillColor: Color(0xFFDDDDDD),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 10), // Geser ke kanan
                          child: Icon(Icons.person_outline_rounded),
                        ),

                        contentPadding: EdgeInsets.only(left:25),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFDDDDDD), width: 2),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(color: Color(0xFFDDDDDD))
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, bottom: 5),
                      child: Text(
                        "Kata Sandi",
                        style: TextStyle(
                          fontSize: 18, 
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                    ) 
                  ),

                  SizedBox(
                    height: 45,
                    child: TextField(
                      controller: _passwordController,

                      obscureText: _obscureText,

                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFDDDDDD),
                        contentPadding: EdgeInsets.only(left:25),
                        hintText: 'Kata Sandi',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 10), // Geser ke kanan
                          child: Icon(Icons.lock_outline),
                        ),

                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10), // Geser ke kanan
                          child: IconButton(
                            icon: Icon(
                              _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            ),
                            onPressed: _toggleObscure,
                          ),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFDDDDDD), width: 2),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(color: Color(0xFFDDDDDD)),
                        ),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                        child: TextButton(
                          onPressed: () {
                          },
                          child: Text(
                            'Lupa Password?',
                            style: TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                              decorationColor: Theme.of(context).colorScheme.primary,
                              color: Theme.of(context).colorScheme.primary
                            ),
                          )
                        ),
                    ),
                   ),

                  SizedBox(height: 24),

                  SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: _handleLogin,

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary
                      ),
                      child: Text(
                        'Masuk',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Belum punya akun?",
                        style: TextStyle(fontSize: 14),
                      ),

                      SizedBox(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => RegisterPage()),
                            );
                          },
                          child: Text(
                            'Yuk daftar!',
                            style: TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                              decorationColor: Theme.of(context).colorScheme.primary,
                              color: Theme.of(context).colorScheme.primary
                            ),
                          )
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 15),

                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'atau',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),

                  SizedBox(
                    height: 40,
                    width: 300,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Aksi login Google
                      },
                      icon: Image.asset(
                        'assets/images/google.png',
                        height: 24,
                        width: 24,
                      ),
                      label: Text(
                        'Masuk dengan Google',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.symmetric(vertical: 8),
                        elevation: 0,
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  SizedBox(
                    height: 40,
                    width: 300,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Aksi login Google
                      },
                      icon: Image.asset(
                        'assets/images/apple.png',
                        height: 18,
                        width: 18,
                      ),
                      label: Text(
                        'Masuk dengan Apple',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.symmetric(vertical: 8),
                        elevation: 0,
                      ),
                    ),
                  ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
