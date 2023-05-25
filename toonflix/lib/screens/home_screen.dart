import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 기준 Column
      body: Column(
        children: [
          // 첫 번째 Flexible
          Flexible(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
            ),
          ),

          // 두 번째 Flexible
          Flexible(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
            ),
          ),

          // 세 번째 Flexible
          Flexible(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
