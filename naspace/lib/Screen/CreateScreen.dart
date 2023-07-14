import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naspace/Widget/ShortContainerLine.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
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

  // User 정보 불러오기
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
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
                            Container(),
                            Positioned(
                              top: 30,
                              left: 10,
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 70,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(70),
                                  child: Image.network(
                                    '${(snapshot.data as Map)['userProfileImage']}',
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 100,
                              left: 170,
                              child: Text(
                                '${(snapshot.data as Map)['userName']}님',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Positioned(
                              top: 140,
                              left: 170,
                              child: Text(
                                '어떤 음악을 추천 받고 싶나요?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 20,
                              right: 0,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 210),
                        const shortContainerLine(color: Colors.amber),
                        const SizedBox(height: 10),

                        // 제목
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '게시물 작성',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const shortContainerLine(color: Colors.amber),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            DottedBorder(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width - 20,
                                child: FadeInImage.assetNetwork(
                                    fit: BoxFit.cover,
                                    placeholder: 'lib/Image/Logo/NAspace2.png',
                                    image: (snapshot.data
                                        as Map)['userProfileBgImage']),
                              ),
                            ),
                            const SizedBox(height: 5),

                            // 이미지 등록 버튼
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  child: const Text('이미지 등록')),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
