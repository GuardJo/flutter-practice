class WebtoonDetail {
  final String title;
  final String about;
  final String genre;
  final String age;
  final String thumb;

  WebtoonDetail.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        about = json["about"],
        genre = json["genre"],
        age = json["age"],
        thumb = json["thumb"];
}
