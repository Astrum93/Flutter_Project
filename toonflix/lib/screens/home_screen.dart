import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 25분을 의미하는 변수
  static const twentyFiveMinutes = 1500;

  // 시간
  int totalSeconds = twentyFiveMinutes;

  // 일시정지 조건 변수
  bool isRunning = false;

  // Dart의 표준 라이브러리 Timer 선언
  late Timer timer;

  // Total Pomodoros
  int totalPomodoros = 0;

  ////////////////////////////////////////////////////////////////////

  // Timer의 Duration이 실행 시킬 함수
  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
        totalSeconds = twentyFiveMinutes;
      });
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  // Timer가 실행될 함수
  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  // Timer를 멈추는 함수
  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  // 초 단위를 분 단위로 바꿔주는 함수
  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // 기준 Column
      body: Column(
        children: [
          // 첫 번째 Flexible
          Flexible(
            flex: 1,
            // 첫 번째 Flexible의 첫 번째 Container
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          // 두 번째 Flexible
          Flexible(
            flex: 2,
            child: Center(
              child: IconButton(
                iconSize: 120,
                color: Theme.of(context).cardColor,
                onPressed: isRunning ? onPausePressed : onStartPressed,
                icon: Icon(isRunning
                    ? Icons.pause_circle_outline
                    : Icons.play_circle_outline),
              ),
            ),
          ),

          // 세 번째 Flexible
          Flexible(
            flex: 1,
            // 세 번째 Flexible의 첫 번째 행
            child: Row(
              children: [
                // Container 확장
                Expanded(
                  // 세 번째 Flexible의 첫 번째 행의 Container
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    // Container의 첫 번째 열
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // Container의 첫 번째 열의 Text 위젯들
                      children: [
                        // Container의 첫 번째 열의 첫 번째 Text
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                        // Container의 첫 번째 열의 두 번째 Text
                        Text(
                          '$totalPomodoros',
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
