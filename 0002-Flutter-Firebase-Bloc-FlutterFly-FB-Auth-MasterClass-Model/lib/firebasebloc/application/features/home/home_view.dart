// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_const_constructors

import 'package:flutter_firebase_modal/firebasebloc/application/features/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageWrapper extends StatelessWidget {
  const HomePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff263147),
        title: Center(
          child: Text(
            "0101-FlutterFly-Auth-Bloc",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),

        actions: [
          IconButton(
              onPressed: () {
                final authBoc = BlocProvider.of<AuthBloc>(context);

                authBoc.add(LogoutEvent());

                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.red,
              ))
        ],
      ),
      body: const Center(
        child: Text(
          "Home Page",
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
