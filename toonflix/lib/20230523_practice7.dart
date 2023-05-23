import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

// state가 없는 Widget
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

// state에 따라 가변할 Widget
class _AppState extends State<App> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Click Count'),
              Text('$counter'),
            ],
          ),
        ),
      ),
    );
  }
}
