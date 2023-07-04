import 'package:flutter/material.dart';
import 'package:naspace/Edit%20Image/edit_profile.dart';
import 'package:naspace/Screen/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  // Firebase 인증된 uid
  final _uid = FirebaseAuth.instance.currentUser!.uid;

  // FireStore collection 참조 변수
  CollectionReference userInfo =
      FirebaseFirestore.instance.collection('UserInfo');

  // 현재 유저 정보를 불러오는 함수
  _getUserInfo() async {
    var userinfo = await userInfo.doc(_uid).get();
    return userinfo.data();
  }

  // 이미지 수정 팝업창
  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: EditProfileImage(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder(
          future: _getUserInfo(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? SingleChildScrollView(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              // 프로필 배경
                              Container(
                                width: 500,
                                height: 200,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'lib/Image/Background/universe1.jpg'),
                                  ),
                                ),
                                child: const Text(' '),
                              ),

                              // 프로필 사진
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: -50,
                                child: GestureDetector(
                                  onTap: () {
                                    showAlert(context);
                                  },
                                  child: CircleAvatar(
                                    radius: 50,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.asset(
                                          'lib/Image/profile/pikachu.png'),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen()),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.home,
                                    color: Colors.grey.shade900,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 60),

                          // UserName
                          Text(
                            '${(snapshot.data as Map)['userName']}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),

                          // 프로필 상호작용 버튼들
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.person_add_alt_1_outlined,
                                  color: Colors.green,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.forward_to_inbox_rounded,
                                  color: Colors.blue,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.library_music_outlined,
                                  color: Colors.red,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.bolt_rounded,
                                  color: Colors.yellow,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 350,
                                height: 100,
                                decoration: const BoxDecoration(
                                    color: Colors.transparent),
                                child: const Text(
                                  '안녕하세요 피카츄 입니다. 만나서 반가워용',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.justify,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),

                          // 음악 플레이어
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      Colors.blueGrey.shade100.withOpacity(0.1),
                                  blurRadius: 7,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.asset(
                                          'lib/Image/Thumb/Thumb_Test.jpeg'),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Let Me Leave You',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '그루비룸 (GroovyRoom), GEMINI (제미나이)',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.play_circle_outline_rounded,
                                      color: Colors.grey,
                                      size: 45,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 30),

                          // 프로필 버튼 2개
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      blurRadius: 7,
                                    )
                                  ],
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.music_note_rounded,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Music recommand',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      blurRadius: 7,
                                    )
                                  ],
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.mode_edit_outline_rounded,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Create Contents',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                : const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
