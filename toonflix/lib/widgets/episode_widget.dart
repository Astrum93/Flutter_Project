import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.episode,
  });

  final WebtoonEpisodeModel episode;

  // launchUrl 사용할 함수
  onButtonTap() async {
    // launchUrl 첫 번째 방법
    // final url = Uri.parse("http://www.google.com");
    // await launchUrl(url);

    // launchUrl 두 번째 방법
    await launchUrlString("http://www.google.com");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green.shade300,
          boxShadow: [
            BoxShadow(
              blurRadius: 7,
              offset: const Offset(4, 4),
              color: Colors.grey.withOpacity(1),
            ),
          ],
        ),
        // Container의 첫 번째 행
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 첫 번째 요소 Text
              Text(
                episode.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // 두 번째 요소 Icon
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
