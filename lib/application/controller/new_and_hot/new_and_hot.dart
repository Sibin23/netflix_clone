import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_clone/application/models/new_and_hot/new_and_hot.dart';

import '../../../infrastructure/api_key.dart';

String getUrl =
    'https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey';

Future<List<NewAndHot>> getNewAndHotMovies() async {
  int count = 3;

  while (count >= 0) {
   
    final response = await http.get(Uri.parse(getUrl));
  
    if (response.statusCode == 200) {
      final bodyAsJson = jsonDecode(response.body) as Map<String, dynamic>;
      final data = NewAndHotList.fromJson(bodyAsJson['results']);
      
      return data.newAndHotList;
    }
    count--;
  }
  return [];
}