import 'package:flutter/material.dart';
import 'package:login_register_form/register_page.dart';
import 'package:login_register_form/home_page.dart';
import 'package:login_register_form/data/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart'; // sesi login

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // toggle password
  bool _obscurePassword = true;

  // sesi login
  void _saveLoginSession(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('email', email);
  }

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

        // validasi Input
    if (!email.contains('@')) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Email tidak valid"),
          content: Text("Pastikan email mengandung '@',"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"))],
        ),
      );
      return;
    }

    if (password.length < 8) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Password terlalu pendek"),
          content: Text("Password minimal 8 karakter."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
               child: Text("OK")),
          ],
        ),
      );
      return;
    }

    if (userData.containsKey(email) && userData[email]!['password'] == password) {
      _saveLoginSession(email); // panggil setelah login berhasil
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            fullName: userData[email]!['fullName']!,
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
         builder: (context) {
          return AlertDialog(
            title: Text('Login Gagal'),
            content: Text('Email atau password salah.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                 child: Text('OK')
                ),
            ],
          );
         }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Hero widget 
                Hero(
                  tag: 'app-icon',
                   child: Icon(Icons.lock_person, size: 80, color: Colors.white),
                   ),
                SizedBox(height: 20),
                Text(
                  'Welcome Back',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField( // rubah TextField untuk menampilkan/menyembunyikan password
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                 child: Text('login', style: TextStyle(fontSize: 18)),
                 ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?", style: TextStyle(color: Colors.white70)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text('Sign Up', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ],
                 ),
              ],
            ),
          ),
        ),
      )
    );
  }
}