import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const Center(
            child: Image(
              image: AssetImage('lib/Image/Icon/Login.png'),
            ),
          ),
          const SizedBox(height: 50),
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: const Row(
              children: [
                TextField(
                  decoration: InputDecoration(
                      labelText: 'e-mail',
                      border: OutlineInputBorder(),
                      fillColor: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
