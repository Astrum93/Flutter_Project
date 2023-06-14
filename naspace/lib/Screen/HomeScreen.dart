import 'package:flutter/material.dart';
import 'package:naspace/Widget/InvisibleBox.dart';

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
          fit: BoxFit.cover,
          image: AssetImage('lib/Image/background.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        // AppBar
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.tag_faces_outlined),
            )
          ],
        ),

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            // 메인 컬럼
            child: Column(
              children: [
                // 메인 컬럼의 첫 번째 행
                Row(
                  children: [
                    Text('data1'),
                  ],
                ),
                // 메인 컬럼의 SizedBox
                SizedBox(height: 20),

                // 메인 컬럼의 두 번째 행
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      invisibleBox(width1: 250, height1: 250),
                      SizedBox(width: 10),
                      invisibleBox(width1: 250, height1: 250),
                      SizedBox(width: 10),
                      invisibleBox(width1: 250, height1: 250),
                      SizedBox(width: 10),
                      invisibleBox(width1: 250, height1: 250),
                      SizedBox(width: 10),
                      invisibleBox(width1: 250, height1: 250),
                    ],
                  ),
                ),

                Column(
                  children: [
                    Text('test'),
                    invisibleBox(width1: 100, height1: 100),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
