class WebtoonInfo {
  final String id;
  final String title;
  final String thumb;

  WebtoonInfo.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        thumb = json["thumb"];
}
