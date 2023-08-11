import 'package:flutter/material.dart';

class contentsScreen extends StatefulWidget {
  const contentsScreen({super.key});

  @override
  State<contentsScreen> createState() => _contentsScreenState();
}

class _contentsScreenState extends State<contentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(''),
                      ),
                    ),
                    child: const Text(' '),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
