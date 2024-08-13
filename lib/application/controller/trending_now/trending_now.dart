import 'dart:convert';

import 'package:netflix_clone/application/models/trending_now/trending_now.dart';

import '../../../infrastructure/api_key.dart';
import 'package:http/http.dart' as http;

String getUrl =
    'https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey';

Future<List<TrendingNow>> getTrendingNowMovies() async {
  int count = 3;

  while (count >= 0) {
   
    final response = await http.get(Uri.parse(getUrl));
  
    if (response.statusCode == 200) {
      final bodyAsJson = jsonDecode(response.body) as Map<String, dynamic>;
      final data = TrendingNowList.fromJson(bodyAsJson['results']);
      
      return data.trendingNowList;
    }
    count--;
  }
  return [];
}
