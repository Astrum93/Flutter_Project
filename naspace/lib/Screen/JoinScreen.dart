import 'package:flutter/material.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  // Form Key
  final formKey = GlobalKey<FormState>();

  // 회원가입 Value 저장할 변수
  String userName = '';
  String userMail = '';
  String userPassword = '';
  String userPasswordCheck = '';
  String userPhoneNumber = '';

  void tryValidation() {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image(
                  image: const AssetImage('lib/Image/Icon/vr-headset.png'),
                  // 화면 크기의 -10만큼의 가로 길이
                  width: MediaQuery.of(context).size.width - 10,
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.black),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),

                    // Form
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const Center(
                            child: Text(
                              '회원가입',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 15),

                          // 이름
                          TextFormField(
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            key: const ValueKey(1),
                            validator: (value) {
                              if (value!.isEmpty || value.length < 2) {
                                return '이름을 입력해 주세요.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              userName = value!;
                            },
                            onChanged: (value) {
                              userName = value;
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Colors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                              hintText: "이름",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                          const SizedBox(height: 15),

                          // 이메일
                          TextFormField(
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            key: const ValueKey(2),
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return '올바른 메일을 입력해 주세요.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              userMail = value!;
                            },
                            onChanged: (value) {
                              userMail = value;
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                              hintText: "메일 주소",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                          const SizedBox(height: 15),

                          // 비밀번호
                          TextFormField(
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            key: const ValueKey(3),
                            validator: (value) {
                              if (value!.isEmpty || value.length < 6) {
                                return '최소 6자리 이상을 입력해주세요.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              userPassword = value!;
                            },
                            onChanged: (value) {
                              userPassword = value;
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_open_rounded,
                                color: Colors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                              hintText: "비밀번호",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                          const SizedBox(height: 15),

                          // 비밀번호 재확인
                          TextFormField(
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            key: const ValueKey(4),
                            validator: (value) {
                              if (value!.isEmpty || value.length < 6) {
                                return '비밀번호가 일치하지 않습니다.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              userPasswordCheck = value!;
                            },
                            onChanged: (value) {
                              userPasswordCheck = value;
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outline_rounded,
                                color: Colors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                              hintText: "비밀번호 재확인",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                          const SizedBox(height: 15),

                          // 전화 번호
                          TextFormField(
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            key: const ValueKey(5),
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('-')) {
                                return '올바른 휴대전화 번호를 입력해 주세요.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              userPhoneNumber = value!;
                            },
                            onChanged: (value) {
                              userPhoneNumber = value;
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone_android_rounded,
                                color: Colors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                              hintText: "전화번호",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                          const SizedBox(height: 30),
                          InkWell(
                            onTap: () {
                              tryValidation();
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
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '또는 SNS 간편 가입',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                              ),
                              SizedBox(height: 30),
                            ],
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                minimumSize: const Size(120, 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: Colors.orange.shade900),
                            icon: const Icon(Icons.add),
                            label: const Text('Google'),
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
