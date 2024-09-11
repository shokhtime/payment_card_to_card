import 'package:flutter/material.dart';
import 'package:payme_app/ui/screens/home_screen.dart';

void main() {
  runApp(const PaymeApp());
}

class PaymeApp extends StatelessWidget {
  const PaymeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
