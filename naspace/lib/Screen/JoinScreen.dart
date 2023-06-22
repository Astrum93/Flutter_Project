import 'package:flutter/material.dart';

class JoinScreen extends StatelessWidget {
  const JoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 15, 15, 15).withOpacity(0.3),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Welcome Music is Life'),
      ),
      body: const Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Text(
              '회원가입',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
