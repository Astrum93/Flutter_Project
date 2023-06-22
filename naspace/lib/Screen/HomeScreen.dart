import 'package:flutter/material.dart';
import 'package:naspace/Screen/JoinScreen.dart';
import 'package:naspace/Screen/LoginScreen.dart';
import 'package:naspace/Screen/MyScreen.dart';
import 'package:naspace/Widget/InvisibleBox_Basic.dart';
import 'package:naspace/Widget/InvisibleBox_Hot.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color homebgc = const Color.fromARGB(255, 0, 3, 28);

  @override
  Widget build(BuildContext context) {
    // 배경 이미지
    return Container(
      decoration: BoxDecoration(color: homebgc),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        // AppBar
        appBar: AppBar(
          backgroundColor:
              const Color.fromARGB(255, 15, 15, 15).withOpacity(0.3),
          foregroundColor: Colors.white,
          centerTitle: true,
          title: const Text('Music is Life'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_rounded),
            ),

            // 개인 프로필
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const MyScreen()),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 17,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset('lib/Image/profile/pikachu.png'),
                ),
              ),
            ),
          ],
        ),
        drawer: const Drawer(),

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            // 메인 컬럼
            child: Column(
              children: [
                // 메인 컬럼의 SizedBox
                const SizedBox(height: 10),

                // 메인 컬럼의 두 번째 행
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InvisibleBoxHot(),
                      SizedBox(width: 15),
                      InvisibleBoxHot(),
                      SizedBox(width: 15),
                      InvisibleBoxHot(),
                      SizedBox(width: 15),
                      InvisibleBoxHot(),
                      SizedBox(width: 15),
                      InvisibleBoxHot(),
                    ],
                  ),
                ),

                // 메인 컬럼 SizedBox
                const SizedBox(height: 40),

                // 메인 컬럼 세 번째 열
                const Column(
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                // 메인 컬럼 SizedBox
                const SizedBox(height: 20),

                // 로그인 버튼
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LogInScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.login,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const JoinScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.person_add_alt_1_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // 메인 컬럼 네 번째 컨테이너 (Invisible)
                const InvisibleBoxBasic(),
                // 메인 컬럼 SizedBox
                const SizedBox(height: 40),

                // 메인 컬럼 네 번째 열
                const Column(
                  children: [
                    Text(
                      '2222',
                      style: TextStyle(
                        color: Colors.white,
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
                        Text(
                          'test',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
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
                        color: Colors.white,
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
                        Text(
                          'test',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Bottom Navigation Bar
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade600,
          showUnselectedLabels: false,
          backgroundColor:
              const Color.fromARGB(255, 15, 15, 15).withOpacity(0.1),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: 'search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.create),
              label: 'create',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.messenger_outline_rounded),
              label: 'messenger',
            ),
          ],
        ),
      ),
    );
  }
}
