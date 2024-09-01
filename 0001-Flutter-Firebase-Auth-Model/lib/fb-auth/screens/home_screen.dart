// ignore_for_file: use_build_context_synchronously

import 'package:flutter_firebase_modal/fb-auth/auth/auth_service.dart';
import 'package:flutter_firebase_modal/fb-auth/auth/login_screen.dart';
import 'package:flutter_firebase_modal/fb-auth/widgets/button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(child: Text("Home Screen")),
        // title: Text(widget.title),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome User",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: "Sign Out",
              onPressed: () async {
                await auth.signout();
                goToLogin(context);
              },
            )
          ],
        ),
      ),
    );
  }

  goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen(title: '',)),
      );
}
