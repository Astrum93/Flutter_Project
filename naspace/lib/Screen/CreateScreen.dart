import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naspace/Profile_Edit/edit_Contents_Image.dart';
import 'package:naspace/Screen/MyScreen.dart';
import 'package:naspace/Widget/ShortContainerLine.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  // 이미지 등록 유무
  final bool _selected = true;

  // Firebase 인증된 uid
  final _uid = FirebaseAuth.instance.currentUser!.uid;

  // FireStore collection 참조 변수
  CollectionReference userInfo =
      FirebaseFirestore.instance.collection('UserInfo');

  // FireStore collection 참조 변수
  CollectionReference userContents =
      FirebaseFirestore.instance.collection('UserContents');

  // 현재 유저 정보를 불러오는 함수
  _getUserInfo() async {
    var userinfo = await userInfo.doc(_uid).get();
    return userinfo.data();
  }

  // 현재 유저 정보를 불러오는 함수
  _getUserContents() async {
    var usercontents = await userContents.doc(_uid).get();
    return usercontents.data();
  }

  // User 정보 불러오기
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserInfo();
    _getUserContents();
  }

  // 이미지 수정 팝업창
  void showAlert_Contents(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: EditContentsImage(),
        );
      },
    );
  }

  // Image 저장 변수
  File? pickedImage;

  // 현재 인증된 유저
  final currentUser = FirebaseAuth.instance.currentUser;

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
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                            ),
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
                            // Home 버튼
                            Positioned(
                              top: 15,
                              right: 10,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MyScreen()));
                                },
                                icon: const Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
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
                            // 게시물 이미지
                            GestureDetector(
                              onTap: () {
                                showAlert_Contents(context);
                              },
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(10),
                                dashPattern: const [10, 4],
                                strokeCap: StrokeCap.round,
                                color: Colors.blue.shade400,
                                child: FutureBuilder(
                                  future: _getUserContents(),
                                  builder: (context, snapshot) {
                                    return snapshot.hasData
                                        ? Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 200,
                                            decoration: BoxDecoration(
                                                color: Colors.blue.shade50
                                                    .withOpacity(.1),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Image.network(
                                              '${(snapshot.data as Map)['userContentsImage']}',
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : const Center(
                                            child: CircularProgressIndicator());
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
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
