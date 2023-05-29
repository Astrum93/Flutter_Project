import 'package:flutter/material.dart';
import 'package:toonflix/screens/Toonflix_home_screen.dart';
import 'package:toonflix/services/Toonflix_api_service.dart';

void main() {
  ToonflixApiService().getTodaysToons();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ToonflixHomeScreen(),
    );
  }
}
