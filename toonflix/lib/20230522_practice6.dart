import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  runApp(const App());
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            // Padding된 메인 Column
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1번째 Sized Box
                const SizedBox(
                  height: 70,
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
                  height: 50,
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 커스터마이징한 Button 위젯
                    Button(
                      text: 'Transfer',
                      bgColor: Color(0xFFF1B33B),
                      textColor: Colors.black,
                    ),
                    Button(
                      text: 'Request',
                      bgColor: Color(0xff1f2123),
                      textColor: Colors.white,
                    )
                  ],
                ),

                // 다섯번째 Sizedbox
                const SizedBox(
                  height: 50,
                ),

                // 3행
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // 3행의 요소들
                  children: [
                    // 3행 첫 번째 Text
                    const Text(
                      'Wallets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // 3행 두 번째 Text
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),

                // 여섯번째 Sizedbox
                const SizedBox(
                  height: 20,
                ),

                // 첫 번째 카드(Container)
                const CurrencyCard(
                  name: 'Euro',
                  code: 'EUR',
                  amount: '6 428',
                  icon: Icons.euro_rounded,
                  isInverted: false,
                ),
                // 두 번째 카드(Container)
                Transform.translate(
                  offset: const Offset(0, -25),
                  child: const CurrencyCard(
                    name: 'Bitcoin',
                    code: 'BTC',
                    amount: '9 785',
                    icon: Icons.currency_bitcoin,
                    isInverted: true,
                  ),
                ),
                // 세 번째 카드(Container)
                Transform.translate(
                  offset: const Offset(0, -50),
                  child: const CurrencyCard(
                    name: 'Dollar',
                    code: 'USD',
                    amount: '428',
                    icon: Icons.attach_money_outlined,
                    isInverted: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
