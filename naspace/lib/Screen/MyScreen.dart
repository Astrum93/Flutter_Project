import 'package:flutter/material.dart';
import 'package:naspace/Screen/HomeScreen.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
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
                        image: AssetImage('lib/Image/Background/universe1.jpg'),
                      ),
                    ),
                    child: const Text(' '),
                  ),

                  // 프로필 사진
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: -50,
                    child: CircleAvatar(
                      radius: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset('lib/Image/profile/pikachu.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      },
                      icon: Icon(
                        Icons.home,
                        color: Colors.grey.shade900,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 60),

              // UserName
              const Text(
                'Pikachu',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                      Icons.chat_outlined,
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

              // 음악 플레이어
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.shade100.withOpacity(0.1),
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
                          child: Image.asset('lib/Image/Thumb/Thumb_Test.jpeg'),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                      const SizedBox(width: 40),
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
      ),
    );
  }
}
