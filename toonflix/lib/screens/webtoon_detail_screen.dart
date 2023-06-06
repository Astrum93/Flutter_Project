import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/services/Toonflix_api_service.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // State에서 사용할 DetailModel 변수
  late Future<WebtoonDetailModel> webtoon;

  // State에서 사용할 EpisodeModel 변수
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    // State에서 사용할 DetailModel 변수 초기화
    webtoon = ToonflixApiService.getToonById(widget.id);
    // State에서 사용할 EpisodeModel 변수 초기화
    episodes = ToonflixApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    // 네이버 차단을 막기위해 User-Agent(브라우저 값) 정의
    var userAgent = const {
      "User-Agent":
          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
    };
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        // AppBar의 타이틀
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      // 본문 메인 Column
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              // 본문 메인 Column의 첫 번째 행
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    // 본문 메인 Column의 첫 번재 행의 첫 번째 Container
                    child: Container(
                      width: 250,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7,
                              offset: const Offset(10, 10),
                              color: Colors.grey.withOpacity(1),
                            )
                          ]),
                      // 첫 번째 Container의 이미지
                      child: Image.network(
                        widget.thumb,
                        headers: userAgent,
                      ),
                    ),
                  ),
                ],
              ),

              // 본문 메인 Column의 두 번째 SizedBox
              const SizedBox(height: 25),

              // 메인 Column의 첫 번째 FutureBuilder
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // FutureBuilder의 메인 Column의 첫 번째 Text
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(fontSize: 16),
                        ),

                        // FutureBuilder의 메인 Column의 첫 번째 SizedBox
                        const SizedBox(height: 16),

                        // FutureBuilder의 메인 Column의 두 번째 Text
                        Text(
                          '${snapshot.data!.genre} / ${snapshot.data!.age}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  }
                  return const Text('....');
                },
              ),

              // 본문 메인 Column의 두 번째 SizedBox
              const SizedBox(
                height: 50,
              ),
              // 메인 Column의 두 번째 FutureBuilder
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // 두 번째 FutureBuilder의 메인 Column
                    return Column(
                      children: [
                        for (var episode in snapshot.data!)
                          // 메인 Column의 조건이 true일 경우 Container
                          Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                      ],
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
