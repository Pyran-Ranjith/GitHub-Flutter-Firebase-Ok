// ignore_for_file: prefer_const_constructors, dead_code, unused_label

import 'package:flutter/material.dart';
import 'package:flutter_firebase_modal/fb-auth/auth/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: const Wrapper(
      //   title: 'flutter_firebase_modal_1',

      // ),
      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(title: 'Mmodal_1'),
      // home: const Wrapper(
      //   title: 'flutter_firebase_modal_1',

      // ),
    );
  }
}
