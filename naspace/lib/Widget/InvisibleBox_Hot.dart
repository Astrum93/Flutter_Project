import 'package:flutter/material.dart';

class InvisibleBox extends StatelessWidget {
  const InvisibleBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 350,
          height: 380,
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
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: AssetImage('lib/Image/Thumb/Thumb_Test.jpeg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: const Text(''),
                ),
                const SizedBox(height: 15),
                const Text('Let Me Leave You / (노래 제목)'),
                const SizedBox(height: 1),
                const Text('그루비룸 (GroovyRoom), GEMINI (제미나이) / (가수)'),
                // Marquee(
                //   text: '그루비룸 (GroovyRoom), GEMINI (제미나이) / (가수)',
                //   scrollAxis: Axis.horizontal,
                // ),
                const SizedBox(height: 10),
                const Text(
                  'Pikachu (작성자)',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
