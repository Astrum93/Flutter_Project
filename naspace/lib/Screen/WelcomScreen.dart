import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Image 배경
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('lib/Image/WelcomeImage.png'),
        ),
      ),
      child: Scaffold(
        // Scaffold 배경 투명화(transparent)
        backgroundColor: Colors.transparent,

        // 메인 Column
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // 메인 Column의 Container
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.fingerprint,
                      size: 50,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),

            // 메인 SizedBox
            const SizedBox(height: 10),

            // 메인 Row
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '터치',
                  style: TextStyle(fontFamily: ''),
                )
              ],
            ),

            // 메인 SizedBox
            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
