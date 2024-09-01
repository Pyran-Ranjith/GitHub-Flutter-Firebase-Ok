// ignore_for_file: use_build_context_synchronously, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'dart:developer';

import 'package:flutter_firebase_modal/fb-auth/auth/auth_service.dart';
import 'package:flutter_firebase_modal/fb-auth/auth/signup_screen.dart';
import 'package:flutter_firebase_modal/fb-auth/screens/home_screen.dart';
import 'package:flutter_firebase_modal/fb-auth/utils/showSnackbar.dart';
import 'package:flutter_firebase_modal/fb-auth/widgets/button.dart';
import 'package:flutter_firebase_modal/fb-auth/widgets/textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required String title});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();

  final _email = TextEditingController(
    text: 'sithara@gmail.com'
  );
  final _password = TextEditingController(
    text: 'pwsithara'
  );

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: const Text("Login Screen")),
        // title: Text(widget.title),
      ),
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const Spacer(),
            const Text("Login",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
            const SizedBox(height: 50),
            CustomTextField(
              hint: "Enter Email",
              label: "Email",
              controller: _email,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hint: "Enter Password",
              label: "Password",
              controller: _password,
            ),
            const SizedBox(height: 30),
            CustomButton(
              label: "Login",
              onPressed: _login,
            ),
            const SizedBox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Already have an account? "),
              InkWell(
                onTap: () => goToSignup(context),
                child:
                    const Text("Signup", style: TextStyle(color: Colors.red)),
              )
            ]),
            const Spacer()
          ],
        ),
      ),
    );
  }

  goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignupScreen()),
      );

  goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );

  _login() async {
    final user =
        await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      // log("User Logged In");
      log(_email.text + " Logged In");
      showSnackBar(context, _email.text + "Logged In"); // Displaying the error message
      goToHome(context);
    }
  }
}
