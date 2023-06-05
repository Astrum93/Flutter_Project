import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/models/webtoon_model.dart';

class ToonflixApiService {
  // 네이버 웹툰 크롤링 비공식 API주소
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";

  // 오늘의 웹툰
  static const String today = "today";

  // http get()으로 오늘의 웹툰 Url 가져오는 함수
  // asynchronous function
  static Future<List<WebtoonModel>> getTodaysToons() async {
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
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance);
      }
      return webtoonInstances;
    }
    throw Error();
  }

  // Detail_Webtoon 데이터 가져올 함수
  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  // Webtoon_episode 데이터 가져올 함수
  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
