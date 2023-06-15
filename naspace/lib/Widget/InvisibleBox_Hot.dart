import 'package:flutter/material.dart';
import 'package:naspace/Widget/HashTagWidget.dart';

class InvisibleBox extends StatelessWidget {
  const InvisibleBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData(textTheme: const TextTheme());
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 350,
              height: 380,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.6),
                    blurRadius: 7,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      width: 325,
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
                    const Text(
                      'Let Me Leave You',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      '그루비룸 (GroovyRoom), GEMINI (제미나이)',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                      'lib/Image/profile/pikachu.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: const Text(' '),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Pikachu',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              color: Colors.white,
                              iconSize: 25,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border_outlined,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const Row(
          children: [
            HashTagWidget(tagname: '기분좋음'),
            SizedBox(width: 8),
            HashTagWidget(tagname: '신남'),
            SizedBox(width: 8),
            HashTagWidget(tagname: '쇼미11'),
            SizedBox(width: 8),
            HashTagWidget(tagname: 'GEMINI'),
          ],
        ),
      ],
    );
  }
}
