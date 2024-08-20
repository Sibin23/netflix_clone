import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/application/controller/controller/top_rated/top_rated.dart';
import 'package:netflix_clone/application/models/top_rated/top_rated.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/strings.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget({super.key});

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  List<TopRated> trending = [];
  bool isLoading = true;
  bool isError = false;
  Future getTrendingNow() async {
    try {
      List<TopRated> movies = await getTopRatedMovies();

      if (mounted) {
        setState(() {
          trending = movies;

          isLoading = false;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching upcoming movies: $e');
      }
      if (mounted) {
        setState(() {
          isError = true;
          isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    getTrendingNow();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : isError
            ? const Center(
                child: Text('Error fetching Movies'),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SearchTextTitle(title: 'Movies & TV'),
                  h10,
                  Expanded(
                      child: GridView.count(
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          crossAxisCount: 3,
                          childAspectRatio: 1 / 1.4,
                          shrinkWrap: true,
                          children: List.generate(10, (index) {
                            return MainCard(
                              image: trending[index].imagePath,
                            );
                          })))
                ],
              );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(baseUrl + image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
