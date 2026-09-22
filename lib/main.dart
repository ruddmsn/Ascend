import 'package:flutter/material.dart';
import 'theme/colors.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const AscendApp());
}

class AscendApp extends StatelessWidget {
  const AscendApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: kBg, useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}