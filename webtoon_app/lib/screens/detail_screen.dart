import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webtoon_app/models/webtoon_detail.dart';
import 'package:webtoon_app/models/webtoon_episode.dart';
import 'package:webtoon_app/models/webtoon_model.dart';
import 'package:webtoon_app/services/api_service.dart';
import 'package:webtoon_app/widgets/eposide_widget.dart';

class WebtoonDetailScreen extends StatefulWidget {
  final WebtoonInfo webtoon;

  const WebtoonDetailScreen({
    super.key,
    required this.webtoon,
  });

  @override
  State<WebtoonDetailScreen> createState() => _WebtoonDetailScreenState();
}

class _WebtoonDetailScreenState extends State<WebtoonDetailScreen> {
  late final Future<WebtoonDetail> webtoonDetail;
  late final Future<List<WebtoonEpisode>> episodes;
  late final SharedPreferences prefs;

  final String _likeListKey = "likeList";

  bool isLike = false;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();

    var likeList = prefs.getStringList(_likeListKey);

    if (likeList != null) {
      if (likeList.contains(widget.webtoon.id)) {
        setState(() {
          isLike = true;
        });
      }
    } else {
      prefs.setStringList(_likeListKey, []);
    }
  }

  void chnageLikeState() {
    var likeList = prefs.getStringList(_likeListKey);

    if (likeList!.contains(widget.webtoon.id)) {
      likeList.remove(widget.webtoon.id);
    } else {
      likeList.add(widget.webtoon.id);
    }

    prefs.setStringList(_likeListKey, likeList);

    setState(() {
      isLike = !isLike;
    });
  }

  @override
  void initState() {
    super.initState();
    webtoonDetail = WebtoonApiService.getWebtoonDetailById(widget.webtoon.id);
    episodes = WebtoonApiService.getWebtoonEpisodeById(widget.webtoon.id);
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: chnageLikeState,
            icon: Icon(
              isLike ? Icons.favorite : Icons.favorite_outline,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        title: Text(widget.webtoon.title),
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.webtoon.id,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(10, -10),
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      clipBehavior: Clip.hardEdge,
                      width: 300,
                      child: Image.network(widget.webtoon.thumb),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder(
                future: webtoonDetail,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data!;
                    return Column(
                      children: [
                        Text(data.about),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("${data.age} / ${data.genre}")
                      ],
                    );
                  } else {
                    return const Text("...");
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var episodeDatas = snapshot.data!;

                    return Column(
                      children: [
                        for (var episodeData in episodeDatas)
                          EpisodeButton(
                            episodeData: episodeData,
                            webtoonId: widget.webtoon.id,
                          )
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
