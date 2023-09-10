import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:naspace/Widget/MusicPlayer.dart';

import '../Widget/ShortContainerLine.dart';

class ContentsScreen extends StatefulWidget {
  final String contents, contents_image, id;
  const ContentsScreen(
      {super.key,
      required this.contents,
      required this.contents_image,
      required this.id});

  @override
  State<ContentsScreen> createState() => _ContentsScreenState();
}

class _ContentsScreenState extends State<ContentsScreen> {
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

  // 좋아요
  var isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          // 유저 정보 FutureBuilder
          FutureBuilder(
            future: _getUserInfo(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ?
                  // 유저 프로필 사진 및 아이디
                  Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              // 유저 프로필 사진
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 15,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                    '${(snapshot.data as Map)['userProfileImage']}',
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),

                              // 유저 아이디
                              Text(
                                '${(snapshot.data as Map)['userName']}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),

                          // 좋아요 버튼
                          Row(
                            children: [
                              IconButton(
                                color: Colors.white,
                                iconSize: 25,
                                onPressed: () {
                                  setState(() {
                                    isLiked = true;
                                  });
                                },
                                icon: Icon(
                                  isLiked == false
                                      ? Icons.favorite_border_outlined
                                      : Icons.favorite,
                                  color: Colors.pink,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  : const CircularProgressIndicator();
            },
          ),

          // 게시물 이미지
          Hero(
            tag: widget.contents_image,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Image.network(
                widget.contents_image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // 음악 플레이어
          const music_player(),

          const SizedBox(height: 15),

          // 콘텐츠 글
          // 글자 상태에 따라 줄이고 늘리고 작업해야함..
          Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        widget.contents,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                // 댓글 더 보기
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          const Text(
                            "댓글 더보기",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_drop_down),
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          const shortContainerLine(color: Colors.blue),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
