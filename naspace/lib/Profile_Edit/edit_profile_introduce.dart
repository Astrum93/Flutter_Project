import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditProfileIntroduce extends StatefulWidget {
  const EditProfileIntroduce({super.key});

  @override
  State<EditProfileIntroduce> createState() => _nameState();
}

class _nameState extends State<EditProfileIntroduce> {
  // 현재 인증된 유저
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: 150,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const Text(
              '프로필 소개 변경',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            // 이름
            TextFormField(
              keyboardType: TextInputType.text,
              strutStyle: const StrutStyle(height: 8),
              style: const TextStyle(
                color: Colors.white,
              ),
              key: const ValueKey(1),
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.format_quote,
                  size: 40,
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                // hintText: "프로필 소개",
                // hintStyle: TextStyle(
                //   color: Colors.grey,
                //   fontSize: 12,
                //   fontWeight: FontWeight.bold,
                // ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),

            const SizedBox(height: 20),

            // 닫기 버튼
            TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
              label: const Text(
                'Close',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
