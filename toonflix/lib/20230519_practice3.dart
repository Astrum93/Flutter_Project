import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // 배경색
        backgroundColor: const Color(0xFF181818),
        // 본문 UI
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          // Padding된 메인 Column
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1번째 Sized Box
              const SizedBox(
                height: 80,
              ),
              // 1행
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // 1번째 요소
                children: [
                  // 1행의 1열
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    // 1행 1열의 요소
                    children: [
                      // 1행 1열의 1번째 Text
                      const Text(
                        'Hey, Master',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800),
                      ),
                      // 1행 1열의 2번째 Text
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ],
              ),

              // 두 번째 Sized Box
              const SizedBox(
                height: 120,
              ),
              // 독립적인 첫 번째 Text
              Text(
                'Total balance',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              // 세 번째 Sized Box
              const SizedBox(
                height: 5,
              ),
              // 독립적인 두 번째 Text
              const Text(
                '\$5 194 482',
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              // 네 번째 Sizedbox
              const SizedBox(
                height: 30,
              ),

              // 2행
              Row(
                children: [
                  // 2행의 첫번째 Container
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(45),
                    ),

                    // 2행 첫 번째 Container의 첫 번째 요소
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 50,
                      ),

                      // 2행 첫 번째 Container의 두 번째 요소
                      child: Text(
                        'Transfer',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
