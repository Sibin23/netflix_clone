import 'package:flutter/material.dart';
import 'package:netflix_clone/application/controller/controller/popular/popular.dart';
import 'package:netflix_clone/application/controller/controller/top_rated/top_rated.dart';
import 'package:netflix_clone/application/controller/controller/trending_now/trending_now.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/strings.dart';
import 'package:netflix_clone/application/models/popular/popular.dart';
import 'package:netflix_clone/application/models/top_rated/top_rated.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

import '../../../application/models/trending_now/trending_now.dart';

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget({super.key});

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  List<TopRated> trending = [];
  Future getTrendingNow() async {
    trending = await getTopRatedMovies();
  }

  @override
  void initState() {
    getTrendingNow();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: 'Movies & TV'),
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
