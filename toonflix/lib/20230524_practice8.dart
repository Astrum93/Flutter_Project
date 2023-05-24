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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Theme
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: const Scaffold(
        backgroundColor: Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 첫 번째 열의 첫 번째 Text
              MyLargeTitle(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatelessWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'My Large Title',
      style: TextStyle(fontSize: 30),
    );
  }
}
