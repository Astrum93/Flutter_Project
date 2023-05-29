import 'package:http/http.dart' as http;

class ToonflixApiService {
  // 네이버 웹툰 크롤링 비공식 API주소
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";

  // 오늘의 웹툰
  final String today = "today";

  // http get()으로 오늘의 웹툰 Url 가져오는 함수
  // asynchronous function
  void getTodaysToons() async {
    // 오늘의 웹툰 url
    final url = Uri.parse('$baseUrl/$today');

    // Response로 받는 await의 값
    final response = await http.get(url);

    // Response의 조건
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}
