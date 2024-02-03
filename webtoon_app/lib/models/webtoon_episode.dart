class WebtoonEpisode {
  final String id;
  final String thumb;
  final String title;
  final String rating;
  final String date;

  WebtoonEpisode.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        thumb = json["thumb"],
        title = json["title"],
        rating = json["rating"],
        date = json["date"];
}
