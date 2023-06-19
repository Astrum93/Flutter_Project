import 'package:flutter/material.dart';
import 'package:naspace/Screen/WelcomScreen.dart';

void main() {
  runApp(const NAspace());
}

class NAspace extends StatelessWidget {
  const NAspace({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
