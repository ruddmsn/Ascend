import 'package:flutter/material.dart';
import '../theme/colors.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBg,
      body: Center(child: Text('오늘의 질문', style: TextStyle(color: kText, fontSize: 20))),
    );
  }
}