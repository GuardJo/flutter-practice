import 'dart:html';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webtoon_app/models/webtoon_episode.dart';

class EpisodeButton extends StatelessWidget {
  const EpisodeButton({
    super.key,
    required this.episodeData,
    required this.webtoonId,
  });

  final WebtoonEpisode episodeData;
  final String webtoonId;

  void goEpisodeView() async {
    var uri = Uri.parse(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episodeData.id}");
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: goEpisodeView,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              episodeData.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(Icons.arrow_forward_ios_outlined),
          ],
        ),
      ),
    );
  }
}
