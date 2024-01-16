import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon_app/models/webtoon_model.dart';

class WebtoonApiService {
  final String _baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String _suffixToday = "today";

  Future<List<WebtoonInfo>> printData() async {
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
}
