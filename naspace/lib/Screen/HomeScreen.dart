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
      backgroundColor: Colors.white,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  color: Colors.grey.withOpacity(0.7),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  color: Colors.red.withOpacity(0.7),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  color: Colors.blue.withOpacity(0.7),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  color: Colors.green.withOpacity(0.7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
