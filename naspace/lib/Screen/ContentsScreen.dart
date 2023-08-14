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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
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
                          // 유저 프로필 사진과 유저 아이디
                          const Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Row(
                              children: [
                                Text(
                                  'UserName',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
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
        ));
  }
}
