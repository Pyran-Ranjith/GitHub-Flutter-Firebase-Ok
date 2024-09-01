// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_modal/fb-auth/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      );

  runApp(const MyApp());
}
