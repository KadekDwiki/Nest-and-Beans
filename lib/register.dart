import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telponController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  bool _obscureText = true;

  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _telponController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool isValidGmail(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
    return regex.hasMatch(email);
  }

  bool isValidTelpon(String telpon) {
    final regex = RegExp(r'^\d{10,13}$');
    return regex.hasMatch(telpon);
  }

  //validasi password
  bool isValidPassword(String password) {
    final regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    return regex.hasMatch(password);
  }

  

  //logic validasi email dan password
  void _handleRegister() {
    String name = _nameController.text;
    String email = _emailController.text;
    String telpon = _telponController.text;
    String password = _passwordController.text;
    

    if (name.isEmpty || email.isEmpty || password.isEmpty || telpon.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Data belum lengkap")),
      );
      return;
    }else if (!isValidGmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Email tidak valid")),
      );
      return;
    }else if (!isValidPassword(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password minimal 8 karakter mengandung huruf dan angka")),
      );
      return;
    }else if (!isValidTelpon(telpon)){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Nomor Telepon tidak valid")),
      );
      return;
    }

    // Jika semua validasi lolos
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
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
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Text(
                      "Daftar",
                      style: TextStyle(
                        fontSize: 27, 
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary
                      ),
                    ),
                  ) 
                ),

                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 52),
                    child: Text(
                      "Buat akunmu dan pilih menu favoritmu",
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.primary
                      ),
                    ),
                  ) 
                ),

                SizedBox(height: 30),

                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, bottom: 5),
                    child: Text(
                      "Nama",
                      style: TextStyle(
                        fontSize: 14, 
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary
                      ),
                    ),
                  ) 
                ),

                SizedBox(
                  height: 30,
                  child: TextField(
                    controller: _nameController,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Nama',
                      filled: true,
                      fillColor: Color(0xFFDDDDDD),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 10), // Geser ke kanan
                        child: Icon(
                          Icons.person_outline_rounded,
                          size: 20
                        ),
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

                SizedBox(height: 15),

                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, bottom: 5),
                    child: Text(
                      "E-mail",
                      style: TextStyle(
                        fontSize: 14, 
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary
                      ),
                    ),
                  ) 
                ),

                SizedBox(
                  height: 30,
                  child: TextField(
                    controller: _emailController,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                      filled: true,
                      fillColor: Color(0xFFDDDDDD),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 10), // Geser ke kanan
                        child: Icon(
                          Icons.mail_outline,
                          size: 20
                        ),
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

                SizedBox(height: 15),

                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, bottom: 5),
                    child: Text(
                      "Nomor Telepon",
                      style: TextStyle(
                        fontSize: 14, 
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary
                      ),
                    ),
                  ) 
                ),

                SizedBox(
                  height: 30,
                  child: TextField(
                    controller: _telponController,
                    keyboardType: TextInputType.number, 
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Nomor Telepon',
                      filled: true,
                      fillColor: Color(0xFFDDDDDD),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 10), // Geser ke kanan
                        child: Icon(
                          Icons.call_outlined,
                          size: 20
                        ),
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

                SizedBox(height: 15),

                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, bottom: 5),
                    child: Text(
                      "Kata Sandi",
                      style: TextStyle(
                        fontSize: 14, 
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary
                      ),
                    ),
                  ) 
                ),

                SizedBox(
                  height: 30,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Kata Sandi',
                      filled: true,
                      fillColor: Color(0xFFDDDDDD),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 10), // Geser ke kanan
                        child: Icon(
                          Icons.lock_outline,
                          size: 20
                        ),
                      ),

                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10), // Geser ke kanan
                        child: IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            size: 17
                          ),
                          onPressed: _toggleObscure,
                        ),
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
                

                SizedBox(height: 44),

                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: _handleRegister,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary
                    ),
                    child: Text(
                      'Daftar',
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
                      "Sudah punya akun?",
                      style: TextStyle(fontSize: 14),
                    ),

                    SizedBox(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          'Yuk masuk!',
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

                SizedBox(height: 70),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dengan menekan Daftar, anda setuju pada",
                      style: TextStyle(fontSize: 10),
                    ),

                  SizedBox(
                      height: 30,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterPage()),
                          );
                        },
                        child: Text(
                          'Terms and Data Policy',
                          style: TextStyle(
                            fontSize: 10,
                            decoration: TextDecoration.underline,
                            decorationColor: Theme.of(context).colorScheme.primary,
                            color: Theme.of(context).colorScheme.primary
                          ),
                        )
                      ),
                    )

                  ],
                )
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}



