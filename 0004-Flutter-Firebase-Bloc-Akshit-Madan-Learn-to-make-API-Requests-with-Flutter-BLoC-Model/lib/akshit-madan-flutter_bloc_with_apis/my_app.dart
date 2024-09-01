import 'package:flutter/material.dart';
import 'package:flutter_firebase_modal/akshit-madan-flutter_bloc_with_apis/features/posts/ui/posts_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: PostsPage(),
    );
  }
}