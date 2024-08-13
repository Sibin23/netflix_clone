class TrendingNow {
  late int id;
  late String title;
  late String overview;
  late String releaseDate;
  late String imagePath;

  String imageBase = 'https://image.tmdb.org/t/p/w500';

  TrendingNow(
      {required this.id,
      required this.title,
      required this.overview,
      required this.releaseDate,
      required this.imagePath});

  factory TrendingNow.fromJson(Map<String, dynamic> json) {
    return TrendingNow(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        imagePath: json['poster_path']);
  }
}

class TrendingNowList {
  List<TrendingNow> trendingNowList;
  TrendingNowList({required this.trendingNowList});

  factory TrendingNowList.fromJson(List<dynamic> json) {
    List<TrendingNow> trendingNow = [];
    trendingNow = json.map((top) => TrendingNow.fromJson(top)).toList();
    return TrendingNowList(trendingNowList: trendingNow);
  }
}