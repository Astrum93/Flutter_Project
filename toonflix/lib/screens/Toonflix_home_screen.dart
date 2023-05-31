import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/Toonflix_api_service.dart';

class ToonflixHomeScreen extends StatefulWidget {
  const ToonflixHomeScreen({super.key});

  @override
  State<ToonflixHomeScreen> createState() => _ToonflixHomeScreenState();
}

class _ToonflixHomeScreenState extends State<ToonflixHomeScreen> {
  // state가 가지는 데이터
  // 웹툰 데이터를 받을 리스트
  List<WebtoonModel> webtoons = [];

  // isLoading state
  bool isLoading = true;

  // 웹툰정보 상태 함수
  void waitForWebToons() async {
    webtoons = await ToonflixApiService.getTodaysToons();
    isLoading = false;
    setState(() {});
  }

  // 상태 생성자
  @override
  void initState() {
    super.initState();
    waitForWebToons();
  }

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    print(isLoading);
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
