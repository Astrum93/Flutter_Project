import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // 배경색
        backgroundColor: Color(0xFF181818),
        // 본문 UI
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          // Padding된 메인 Column
          child: Column(
            children: [
              SizedBox(
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
                      Text(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
