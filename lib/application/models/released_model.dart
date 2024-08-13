class ReleasedModel {
  List<dynamic> imageUrl ;
  ReleasedModel({required this.imageUrl});
  factory ReleasedModel.fromJson(Map<String, dynamic> json) {
    return ReleasedModel(imageUrl: json['poster_path']);
  }
  Map<String, dynamic> toJson() => {'poster_path': imageUrl};
}