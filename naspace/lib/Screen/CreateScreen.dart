// ignore_for_file: unused_field

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

import 'package:naspace/Screen/MyScreen.dart';
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

  // Image 저장 변수
  File? pickedImage;

  // 현재 인증된 유저
  final currentUser = FirebaseAuth.instance.currentUser;

  // 컨텐츠 이미지
  _selectContentsImage() async {
    final imagePicker = ImagePicker();
    final pickedImageFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
      maxHeight: 300,
    );
    setState(() {
      if (pickedImageFile != null) {
        pickedImage = File(pickedImageFile.path);
      }
    });

    // 클라우드 스토리지 버킷에 경로 생성
    final refContentsImage = FirebaseStorage.instance
        .ref()
        .child('picked_contents_image')
        .child('${currentUser!.uid}_ContentsImage.png');
    // 클라우드 스토리지 버킷에 저장
    await refContentsImage.putFile(pickedImage!);

    // 저장한 이미지 url로 변환
    final myurl = await refContentsImage.getDownloadURL();

    if (myurl.isNotEmpty) {
      // Firestore의 UserInfo에 저장
      await FirebaseFirestore.instance
          .collection('UserContents')
          .doc(currentUser!.uid)
          .update({
        'userContentsImage': myurl,
      });
    }
    setState(() {
      CreateScreen;
    });
  }

  // Form Key
  final formKey = GlobalKey<FormState>();

  // 컨텐츠 내용 저장할 변수
  String contents = '';

  // 로딩 스피너 상태 변수
  bool _loading = false;

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

                            // 프로필 사진
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

                            // 프로필 아이디
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

                        // 게시물 작성
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

                        // 게시물 제목 입력

                        const SizedBox(height: 10),

                        // 게시물 이미지
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // 게시물 이미지 출력
                            GestureDetector(
                              onTap: () async {
                                try {
                                  _selectContentsImage();
                                } catch (e) {
                                  const CircularProgressIndicator();
                                }
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
                                    return pickedImage != null
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
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl:
                                                  "${(snapshot.data as Map)['userContentsImage']}",
                                              placeholder: (context, url) =>
                                                  const CircularProgressIndicator(
                                                strokeWidth: 1,
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          )
                                        : SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 200,
                                            child: const Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.file_upload_outlined,
                                                  color: Colors.blue,
                                                  size: 50,
                                                ),
                                                SizedBox(height: 15),
                                                Text(
                                                  'Select your file',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),

                        // 컨텐츠 내용 입력.
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              // 프로필 소개 입력 TextFormField
                              DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(10),
                                dashPattern: const [10, 4],
                                strokeCap: StrokeCap.round,
                                color: Colors.blue.shade400,

                                // 입력 창
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  onSaved: (value) {
                                    contents = value!;
                                  },
                                  onChanged: (value) {
                                    contents = value;
                                  },
                                  key: const ValueKey(1),
                                  decoration: const InputDecoration(
                                    hintText: '내용을 입력해 주세요.',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),

                              // 닫기 버튼
                              TextButton.icon(
                                onPressed: () async {
                                  setState(() {
                                    _loading = true;
                                  });

                                  try {
                                    // Firestore의 UserInfo에 update
                                    await FirebaseFirestore.instance
                                        .collection('UserContents')
                                        .doc(currentUser!.uid)
                                        .update({
                                      'userContents': contents,
                                      'time': Timestamp.now()
                                    });

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const MyScreen(),
                                      ),
                                    );
                                    setState(() {
                                      _loading = false;
                                    });
                                  } catch (e) {
                                    print(e);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          '게시글이 정상적으로 작성되지 않았습니다.\n입력하신 내용을 확인해 주세요.',
                                          textAlign: TextAlign.center,
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                },
                                icon: const Icon(Icons.arrow_circle_up_rounded),
                                label: const Text(
                                  'Create',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
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
