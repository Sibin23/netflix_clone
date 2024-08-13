import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/tensed_drama/tensed_drama.dart';
import '../../../infrastructure/api_key.dart';

String getUrl =
    'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey';

Future<List<TensedDrama>> getTensedDramaMovies() async {
  int count = 3;

  while (count >= 0) {
   
    final response = await http.get(Uri.parse(getUrl));
  
    if (response.statusCode == 200) {
      final bodyAsJson = jsonDecode(response.body) as Map<String, dynamic>;
      final data = TensedDramaList.fromJson(bodyAsJson['results']);
      
      return data.tensedDramaList;
    }
    count--;
  }
  return [];
}