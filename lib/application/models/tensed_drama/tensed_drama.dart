class TensedDrama {
  late int id;
  late String title;
  late String overview;
  late String releaseDate;
  late String imagePath;

  String imageBase = 'https://image.tmdb.org/t/p/w500';

  TensedDrama(
      {required this.id,
      required this.title,
      required this.overview,
      required this.releaseDate,
      required this.imagePath});

  factory TensedDrama.fromJson(Map<String, dynamic> json) {
    return TensedDrama(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        imagePath: json['poster_path']);
  }
}

class TensedDramaList {
  List<TensedDrama> tensedDramaList;
  TensedDramaList({required this.tensedDramaList});

  factory TensedDramaList.fromJson(List<dynamic> json) {
    List<TensedDrama> tensedDrama = [];
    tensedDrama = json.map((top) => TensedDrama.fromJson(top)).toList();
    return TensedDramaList(tensedDramaList: tensedDrama);
  }
}