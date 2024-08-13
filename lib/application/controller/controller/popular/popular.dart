import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_clone/application/models/popular/popular.dart';

import '../../../../infrastructure/api_key.dart';

String getUrl =
    'https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey';

Future<List<Popular>> getPopularMovies() async {
  int count = 3;

  while (count >= 0) {
   
    final response = await http.get(Uri.parse(getUrl));
  
    if (response.statusCode == 200) {
      final bodyAsJson = jsonDecode(response.body) as Map<String, dynamic>;
      final data = PopularList.fromJson(bodyAsJson['results']);
      
      return data.popularList;
    }
    count--;
  }
  return [];
}