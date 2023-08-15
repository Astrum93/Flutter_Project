import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class contentsScreen extends StatefulWidget {
  const contentsScreen({super.key});

  @override
  State<contentsScreen> createState() => _contentsScreenState();
}

class _contentsScreenState extends State<contentsScreen> {
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
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // User 게시물
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('UserContents')
                    .doc(_uid)
                    .collection('Contents')
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }

                  // 하위 컬렉션 문서들을 리스트로 표시
                  var subcollectionDocs = snapshot.data!.docs;

                  // ListView.builder 담을 SizedBox
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (Context, index) {
                        var doc = subcollectionDocs[index];
                        var fieldValue = doc.get('ContentsImage');

                        // User 게시물들 일렬로 나열
                        return Column(
                          children: [
                            const SizedBox(height: 20),

                            FutureBuilder(
                              future: _getUserInfo(),
                              builder: (context, snapshot) {
                                return snapshot.hasData
                                    ?
                                    // 유저 프로필 사진 및 아이디
                                    Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              radius: 15,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Image.network(
                                                  '${(snapshot.data as Map)['userProfileImage']}',
                                                  fit: BoxFit.cover,
                                                  alignment: Alignment.center,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              '${(snapshot.data as Map)['userName']}',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      )
                                    : const CircularProgressIndicator();
                              },
                            ),
                            const SizedBox(height: 20),

                            // 컨텐츠 이미지
                            Container(
                              width: MediaQuery.of(context).size.width - 8,
                              height: 250,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(fieldValue),
                                ),
                              ),
                              child: const Text(''),
                            ),
                            const SizedBox(height: 80)
                          ],
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}
