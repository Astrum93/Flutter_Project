import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  // Form Key
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),

      // 입력 제외 부분 Tap하면 키보드 사라지게
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 로그인 메인 이미지
              const Center(
                child: Image(
                  image: AssetImage('lib/Image/Icon/Login.png'),
                ),
              ),
              const SizedBox(height: 50),

              //
              Container(
                decoration: const BoxDecoration(color: Colors.black),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Text(
                                '이메일',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),

                          // 아이디 입력
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'e-mail',
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 15),

                          const Row(
                            children: [
                              Text(
                                '비밀번호',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),

                          // 비밀번호 입력
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'password',
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          const SizedBox(height: 35),

                          // 체크 버튼
                          InkWell(
                            onTap: () {
                              //
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
