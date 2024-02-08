import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon_app/models/webtoon_detail.dart';
import 'package:webtoon_app/models/webtoon_episode.dart';
import 'package:webtoon_app/models/webtoon_model.dart';

class WebtoonApiService {
  static const String _baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String _suffixToday = "today";

  static Future<List<WebtoonInfo>> getWebtoons() async {
    List<WebtoonInfo> webtoons = [];

    var uri = Uri.parse("$_baseUrl/$_suffixToday");
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> contents = jsonDecode(response.body);

      for (var content in contents) {
        WebtoonInfo webtoonInfo = WebtoonInfo.fromJson(content);

        webtoons.add(webtoonInfo);
      }
    }

    return webtoons;
  }

  static Future<WebtoonDetail> getWebtoonDetailById(String webtoonId) async {
    var uri = Uri.parse("$_baseUrl/$webtoonId");
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      dynamic content = jsonDecode(response.body);

      return WebtoonDetail.fromJson(content);
    }

    throw Error();
  }

  static Future<List<WebtoonEpisode>> getWebtoonEpisodeById(
      String webtoonId) async {
    var uri = Uri.parse("$_baseUrl/$webtoonId/episodes");
    var response = await http.get(uri);
    List<WebtoonEpisode> episodes = [];

    if (response.statusCode == 200) {
      List<dynamic> contents = jsonDecode(response.body);

      for (var content in contents) {
        episodes.add(WebtoonEpisode.fromJson(content));
      }
    }

    return episodes;
  }
}
