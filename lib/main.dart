import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const SarapFinderApp());
}

class SarapFinderApp extends StatelessWidget {
  const SarapFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sarap Finder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6B2D8B)),
        fontFamily: 'sans-serif',
      ),
      home: const LoginScreen(),
    );
  }
}
