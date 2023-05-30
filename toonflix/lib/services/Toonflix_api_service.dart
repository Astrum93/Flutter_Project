import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ToonflixApiService {
  // 네이버 웹툰 크롤링 비공식 API주소
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";

  // 오늘의 웹툰
  final String today = "today";

  // http get()으로 오늘의 웹툰 Url 가져오는 함수
  // asynchronous function
  Future<List<WebtoonModel>> getTodaysToons() async {
    // 개별 웹툰을 저장할 리스트
    List<WebtoonModel> webtoonInstances = [];

    // 오늘의 웹툰 url
    final url = Uri.parse('$baseUrl/$today');

    // Response로 받는 await의 값
    final response = await http.get(url);

    // Response의 조건
    // 만약 상태코드가 200과 같다면
    if (response.statusCode == 200) {
      // List로 json데이터를 변환
      final List<dynamic> webtoons = jsonDecode(response.body);
      // 반복문을 통해 각각의 웹툰 출력
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
