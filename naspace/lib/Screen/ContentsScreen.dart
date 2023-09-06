import 'package:flutter/material.dart';

class ContentsScreen extends StatefulWidget {
  final String contents, contents_image, id;
  const ContentsScreen(
      {super.key,
      required this.contents,
      required this.contents_image,
      required this.id});

  @override
  State<ContentsScreen> createState() => _ContentsScreenState();
}

class _ContentsScreenState extends State<ContentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Hero(
            tag: widget.contents_image,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Image.network(
                widget.contents_image,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
