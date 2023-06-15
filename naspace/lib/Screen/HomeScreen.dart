import 'package:flutter/material.dart';
import 'package:naspace/Widget/InvisibleBox_Hot.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // 배경 이미지
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.4,
          fit: BoxFit.cover,
          image: AssetImage('lib/Image/Background/universe4.jpg'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        // AppBar
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: const Text('Music is Life'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu_rounded),
            )
          ],
        ),

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            // 메인 컬럼
            child: Column(
              children: [
                // 메인 컬럼의 SizedBox
                const SizedBox(height: 10),

                // 메인 컬럼의 첫 번째 행
                const Column(
                  children: [
                    Text(
                      'Hot5 🔥',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                // 메인 컬럼의 SizedBox
                const SizedBox(height: 20),

                // 메인 컬럼의 두 번째 행
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InvisibleBox(),
                      SizedBox(width: 10),
                      InvisibleBox(),
                      SizedBox(width: 10),
                      InvisibleBox(),
                      SizedBox(width: 10),
                      InvisibleBox(),
                      SizedBox(width: 10),
                      InvisibleBox(),
                    ],
                  ),
                ),
                // 메인 컬럼 SizedBox
                const SizedBox(height: 40),

                // 메인 컬럼 세 번째 열
                const Column(
                  children: [
                    Text(
                      '1111',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                // 메인 컬럼 SizedBox
                const SizedBox(height: 20),

                // 메인 컬럼 네 번째 컨테이너 (Invisible)
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 7,
                      )
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('test'),
                      ],
                    ),
                  ),
                ),
                // 메인 컬럼 SizedBox
                const SizedBox(height: 40),

                // 메인 컬럼 네 번째 열
                const Column(
                  children: [
                    Text(
                      '2222',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                // 메인 컬럼 SizedBox
                const SizedBox(height: 20),

                // 메인 컬럼 다섯 번째 컨테이너 (Invisible)
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 7,
                      )
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('test'),
                      ],
                    ),
                  ),
                ),
                // 메인 컬럼 SizedBox
                const SizedBox(height: 40),

                // 메인 컬럼 다섯 번째 열
                const Column(
                  children: [
                    Text(
                      '3333',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                // 메인 컬럼 SizedBox
                const SizedBox(height: 20),

                // 메인 컬럼 여섯 번째 컨테이너 (Invisible)
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 7,
                      )
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('test'),
                      ],
                    ),
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
