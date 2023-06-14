import 'package:flutter/material.dart';

class invisibleBox extends StatelessWidget {
  const invisibleBox({
    super.key,
    required this.width1,
    required this.height1,
  });

  final double width1, height1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width1,
      height: height1,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 7,
          )
        ],
      ),
    );
  }
}
