import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/Toonflix_api_service.dart';

class ToonflixHomeScreen extends StatelessWidget {
  ToonflixHomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons =
      ToonflixApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar
      appBar: AppBar(
        // AppBar 음영
        elevation: 2,
        // AppBar 제목 중앙
        centerTitle: true,
        // AppBar 배경색
        backgroundColor: Colors.white,
        // AppBar 글자색
        foregroundColor: Colors.green,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),

      // Toonflix_api_service에서 Future 데이터를 받는 곳
      body: FutureBuilder(
        // Future로 받을 데이터는 List<WebtoonModel>
        future: webtoons,
        // 데이터가 받아진 후 builder
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // snapshot에 데이터가 있다면, ListView로 빌드해서 보여준다.
            return ListView.separated(
              // 보여줄 데이터는 수평으로 스크롤
              scrollDirection: Axis.horizontal,
              // 보여줄 데이터의 개수 정의
              itemCount: snapshot.data!.length,
              // 보여줄 데이터를 index로 변환
              itemBuilder: (context, index) {
                var webtoon = snapshot.data![index];
                print(index);
                return Text(webtoon.title);
              },
              separatorBuilder: (context, index) => const SizedBox(width: 20),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
