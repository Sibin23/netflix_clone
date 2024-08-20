import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/application/controller/controller/new_and_hot/new_and_hot.dart';
import 'package:netflix_clone/application/controller/controller/trending_now/trending_now.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/strings.dart';
import 'package:netflix_clone/application/models/new_and_hot/new_and_hot.dart';
import 'package:netflix_clone/application/models/trending_now/trending_now.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  List<NewAndHot> popular = [];
  List<TrendingNow> trendingNow = [];
  bool isLoading = true;
  bool isError = false;
  Future getMovies() async {
    try {
      List<NewAndHot> movies = await getNewAndHotMovies();
      List<TrendingNow> trending = await getTrendingNowMovies();

      if (mounted) {
        setState(() {
          popular = movies;
          trendingNow = trending;
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
    getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              title: const Text(
                'New & Hot',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              actions: [
                const Icon(Icons.cast, size: 30),
                w10,
                Container(
                  width: 30,
                  height: 30,
                  color: Colors.blue,
                ),
                w10,
              ],
              bottom: TabBar(
                  isScrollable: true,
                  labelColor: blackColor,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  unselectedLabelColor: whiteColor,
                  indicator:
                      BoxDecoration(borderRadius: radius30, color: whiteColor),
                  tabs: const [
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '🍿 Comming Soon',
                        ),
                      ),
                    ),
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("👀 Everyone's watching"),
                      ),
                    )
                  ]),
            )),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : isError
                ? const Center(
                    child: Text('Error fetching Movies'),
                  )
                : TabBarView(
                    children: [_buildComingSoon(), _buildEveryonesWatching()]),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => ComingSoonWidget(
              image: popular[index].imagePath,
              title: popular[index].title,
              releaseDate: popular[index].releaseDate,
              overview: popular[index].overview,
            ));
  }

  Widget _buildEveryonesWatching() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => EveryonesWatchingWidget(
              image: baseUrl + trendingNow[index].imagePath,
              title: trendingNow[index].title,
              overview: trendingNow[index].overview,
            ));
  }
}
