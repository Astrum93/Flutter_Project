import 'package:flutter/material.dart';
import 'package:naspace/Screen/MyScreen.dart';
import 'package:naspace/Widget/InvisibleBox_Basic.dart';
import 'package:naspace/Widget/InvisibleBox_Hot.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 배경 색상
  Color homebgc = const Color.fromARGB(255, 0, 3, 28);

  // Firebase Authentication Instance
  final _authentication = FirebaseAuth.instance;

  // 로그인된 유저
  User? loggedUser;

  // initstate 함수
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  // 현재 유저를 가져오는 함수
  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

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
                backgroundColor: Colors.transparent,
                radius: 17,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'lib/Image/Logo/NAspace.png',
                  ),
                ),
              ),
            ),
          ],
        ),

        // Drawer
        drawer: Drawer(
          backgroundColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(1),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      const Row(
                        children: [
                          Text(
                            'Welcome',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${loggedUser!.email}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 250,
                          height: 250,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -20,
                          left: -20,
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset('lib/Image/Logo/NAspace.png'),
                            ),
                          ),
                        ),

                        // User ID UI
                        Positioned(
                          top: 20,
                          left: 90,
                          child: Container(
                            width: 140,
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.music_note_rounded,
                                    color: Colors.green,
                                    size: 25,
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    "NA",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.fade,
                                    maxLines: 1,
                                    softWrap: false,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // 게시글, Liked, Like
                        Positioned(
                          top: 90,
                          left: 10,
                          child: Container(
                            width: 230,
                            height: 100,
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 7,
                                )
                              ],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // 게시글
                                  Column(
                                    children: [
                                      Text(
                                        '게시글',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '0',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(width: 30),

                                  // 좋아하는 사람
                                  Column(
                                    children: [
                                      Text(
                                        'Liked',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '0',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 30),

                                  // 좋아하는 사람
                                  Column(
                                    children: [
                                      Text(
                                        'Like',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '0',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // 로그아웃 버튼
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 5,
                          child: Center(
                            child: TextButton.icon(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(120, 40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor:
                                      Colors.grey.withOpacity(0.8)),
                              icon: const Icon(Icons.logout_rounded),
                              label: const Text('Logout'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),

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
                      'Test',
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
                const InvisibleBoxBasic(),

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
