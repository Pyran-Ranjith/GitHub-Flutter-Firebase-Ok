// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_firebase_modal/firebasebloc/application/features/auth/views/login_view.dart';
import 'package:flutter_firebase_modal/firebasebloc/application/features/auth/views/user_register_view.dart';
import 'package:flutter_firebase_modal/firebasebloc/application/features/home/home_view.dart';
import 'package:flutter_firebase_modal/firebasebloc/application/features/splash/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        textTheme: TextTheme(
            displayLarge: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 36),
            bodySmall: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 26)),
        // scaffoldBackgroundColor: Color(0xfff263147),
              scaffoldBackgroundColor: Color.fromARGB(255, 231, 174, 241),
  colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 167, 187, 67)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPageWrapper(),
        '/login': (context) => LoginViewWrapper(),
        '/home': (context) => HomePageWrapper(),
        '/register': (context) => RegisterPageWrapper()
      },
    );
  }
}
