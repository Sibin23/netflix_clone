class NewAndHot {
  late int id;
  late String title;
  late String overview;
  late String releaseDate;
  late String imagePath;

  String imageBase = 'https://image.tmdb.org/t/p/w500';

  NewAndHot(
      {required this.id,
      required this.title,
      required this.overview,
      required this.releaseDate,
      required this.imagePath});

  factory NewAndHot.fromJson(Map<String, dynamic> json) {
    return NewAndHot(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        imagePath: json['poster_path']);
  }
}

class NewAndHotList {
  List<NewAndHot> newAndHotList;
  NewAndHotList({required this.newAndHotList});

  factory NewAndHotList.fromJson(List<dynamic> json) {
    List<NewAndHot> newAndHot = [];
    newAndHot = json.map((top) => NewAndHot.fromJson(top)).toList();
    return NewAndHotList(newAndHotList: newAndHot);
  }
}
