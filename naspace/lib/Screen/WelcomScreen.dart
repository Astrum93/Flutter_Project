import 'package:flutter/material.dart';
import 'package:naspace/Screen/HomeScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Image 배경
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('lib/Image/Background/WelcomeImage.png'),
        ),
      ),
      child: Scaffold(
        // Scaffold 배경 투명화(transparent)
        backgroundColor: Colors.transparent,

        // 메인 Column
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // 메인 Column의 Container
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      // Navigator
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.fingerprint,
                        size: 50,
                        color: Colors.white,
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
                    style: TextStyle(
                        fontFamily: '',
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),

              // 메인 SizedBox
              // const SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }
}
