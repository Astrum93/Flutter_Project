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
        body: Center(
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
                  // GridView.builder
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (Context, index) {
                        var doc = subcollectionDocs[index];
                        var fieldValue = doc.get('ContentsImage');
                        return Column(
                          children: [
                            Container(
                              width: 250,
                              height: 250,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(fieldValue),
                                ),
                              ),
                              child: const Text(''),
                            ),
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
