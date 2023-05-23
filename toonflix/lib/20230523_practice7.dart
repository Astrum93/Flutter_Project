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

  void onClicked() {
    setState(() {
      counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 첫 번째 열의 첫 번째 Text
              const Text(
                'Click Count',
                style: TextStyle(fontSize: 30),
              ),

              // 첫 번째 열의 두 번째 Text
              Text(
                '$counter',
                style: const TextStyle(fontSize: 30),
              ),

              // 첫 번째 열의 IconButton
              IconButton(
                iconSize: 40,
                onPressed: onClicked,
                icon: const Icon(
                  Icons.add_box_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
