import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;

  final _blackColor = const Color(0xFF1F2123);

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Container ClipBehavior
      clipBehavior: Clip.hardEdge,
      // Container 꾸미기
      decoration: BoxDecoration(
        color: isInverted ? Colors.white : _blackColor,
        borderRadius: BorderRadius.circular(25),
      ),

      // 카드의 요소 Padding
      child: Padding(
        padding: const EdgeInsets.all(20),
        // 카드의 첫 번째 행
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 첫 번째 행의 첫번째 열
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 첫 번째 행의 첫 번째 열의 Text
                Text(
                  name,
                  style: TextStyle(
                    color: isInverted ? _blackColor : Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // 첫 번째 행의 첫 번째 열의 SizedBox
                const SizedBox(
                  height: 10,
                ),
                // 첫 번째 행의 첫 번째 열의 행
                Row(
                  children: [
                    // 첫 번째 행의 첫 번째 열의 행의 첫 번째 Text
                    Text(
                      amount,
                      style: TextStyle(
                        color: isInverted ? _blackColor : Colors.white,
                        fontSize: 20,
                      ),
                    ),

                    // 첫 번째 행의 첫 번째 열의 행의 SizedBox
                    const SizedBox(
                      width: 5,
                    ),

                    // 첫 번째 행의 첫 번째 열의 행의 두 번째 Text
                    Text(
                      code,
                      style: TextStyle(
                        color: isInverted ? _blackColor : Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // 첫 번째 행의 두번째 요소 Transform
            Transform.scale(
              scale: 1.9,
              child: Transform.translate(
                offset: const Offset(-5, 12),
                // 첫 번째 행의 두번째 요소 Transform된 Icon
                child: Icon(
                  icon,
                  color: isInverted ? _blackColor : Colors.white,
                  size: 88,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
