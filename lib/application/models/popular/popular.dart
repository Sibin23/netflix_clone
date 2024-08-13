class Popular {
  late int id;
  late String title;
  late String overview;
  late String releaseDate;
  late String imagePath;

  String imageBase = 'https://image.tmdb.org/t/p/w500';

  Popular(
      {required this.id,
      required this.title,
      required this.overview,
      required this.releaseDate,
      required this.imagePath});

  factory Popular.fromJson(Map<String, dynamic> json) {
    return Popular(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        imagePath: json['poster_path']);
  }
}

class PopularList {
  List<Popular> popularList;
  PopularList({required this.popularList});

  factory PopularList.fromJson(List<dynamic> json) {
    List<Popular> popular = [];
    popular = json.map((top) => Popular.fromJson(top)).toList();
    return PopularList(popularList: popular);
  }
}