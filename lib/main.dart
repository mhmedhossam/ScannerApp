import 'package:flutter/material.dart';
import 'package:scanner_app/pages/homapage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
