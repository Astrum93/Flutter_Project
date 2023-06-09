import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/services/Toonflix_api_service.dart';
import 'package:toonflix/widgets/episode_widget.dart';

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

  // SharedPreferences를 사용할 변수
  late SharedPreferences prefs;

  // 좋아요의 상태를 나타내는 변수
  bool isLiked = false;

  // 휴대폰 저장소와 Connection할 함수
  Future initPrefs() async {
    // prefs를 휴대폰 저장소와 Connection
    prefs = await SharedPreferences.getInstance();

    // prefs가 'likedToons'라는 key의 리스트를 불러옴
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (likedToons.contains(widget.id) == true) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      prefs.setStringList('likedToons', []);
    }
  }

  @override
  void initState() {
    super.initState();
    // State에서 사용할 DetailModel 변수 초기화
    webtoon = ToonflixApiService.getToonById(widget.id);
    // State에서 사용할 EpisodeModel 변수 초기화
    episodes = ToonflixApiService.getLatestEpisodesById(widget.id);
    // initPrefs() 초기화
    initPrefs();
  }

  // isLiked 상태에 따른 widget.id 추가, 제거
  onHeartTap() async {
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (isLiked) {
        likedToons.remove(widget.id);
      } else {
        likedToons.add(widget.id);
      }
      // 위의 조건문의 결과를 저장
      await prefs.setStringList('likedToons', likedToons);
      // 로직이 끝난 후 초기화
      setState(() {
        isLiked = !isLiked;
      });
    }
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
        // Favorite actions
        actions: [
          IconButton(
            onPressed: onHeartTap,
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_outline_outlined,
            ),
          ),
        ],
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
                          // Episode widget을 초기화
                          Episode(
                            episode: episode,
                            webtoonId: widget.id,
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
