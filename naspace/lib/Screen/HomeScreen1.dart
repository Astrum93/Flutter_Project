import 'package:flutter/material.dart';
import 'package:naspace/Widget/InvisibleBox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // 배경 이미지
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('lib/Image/background.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        // AppBar
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.tag_faces_outlined),
            )
          ],
        ),

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // 첫 번째 Expanded Container
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 392,
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: const Offset(0, 0),
                      blurRadius: 7,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(17),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image:
                                    AssetImage('lib/Image/profile/homer.gif'),
                              )),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'UserID',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),

                    // 두 번째 행
                    const Padding(
                      padding: EdgeInsets.all(17),
                      child: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                '이름 : NA',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: Text(
                                '전화번호 : 010-0000-0000',
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: Text(
                                '주소 : 경기도 화성시 달나라',
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: Text(
                                '전공 : 국제통상학',
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 두 번째 Expanded
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(0, 0),
                        blurRadius: 7,
                      )
                    ],
                  ),
                ),
              ),

              // 세 번째 Expanded
              const invisibleBox(
                width: 150,
                height: 150,
              ),

              // 네 번째 Expanded
              const invisibleBox(
                width: 300,
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
