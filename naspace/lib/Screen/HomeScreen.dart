import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,

      // AppBar
      appBar: AppBar(
        title: const Text('NA SPACE'),
        centerTitle: true,
        backgroundColor: Colors.black.withOpacity(0.5),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.star_rounded),
          )
        ],
      ),

      ////////

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // 첫 번째 Expanded
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      offset: const Offset(7, 7),
                      blurRadius: 7,
                    )
                  ],
                ),
                child: const Row(
                  children: [
                    // 첫 번째 행
                    Padding(
                      padding: EdgeInsets.all(17),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjYmlp9JDeNMaFZzw9S3G1dVztGqF_2vq9nA&usqp=CAU',
                                scale: 2.2),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'User',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),

                    // 두 번째 행
                    Padding(
                      padding: EdgeInsets.all(17),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '이름 : NA',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '전화번호 : 010-0000-0000',
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '주소 : 경기도 화성시 달나라',
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '전공 : 국제통상학',
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 두 번째 Expanded
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      offset: const Offset(7, 7),
                      blurRadius: 7,
                    )
                  ],
                ),
              ),
            ),

            // 세 번째 Expanded
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      offset: const Offset(7, 7),
                      blurRadius: 7,
                    )
                  ],
                ),
              ),
            ),

            // 네 번째 Expanded
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      offset: const Offset(7, 7),
                      blurRadius: 7,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
