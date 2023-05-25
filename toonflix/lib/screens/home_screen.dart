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
                '25:00',
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
                onPressed: () {},
                icon: const Icon(Icons.play_circle_outline),
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
                    decoration:
                        BoxDecoration(color: Theme.of(context).cardColor),
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
                          '0',
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
