import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/application/controller/controller/popular/popular.dart';
import 'package:netflix_clone/application/controller/controller/tensed_drama/tensed_drama.dart';
import 'package:netflix_clone/application/controller/controller/trending_now/trending_now.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/application/models/popular/popular.dart';
import 'package:netflix_clone/application/models/tensed_drama/tensed_drama.dart';
import 'package:netflix_clone/application/models/trending_now/trending_now.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';
import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title_card.dart';

import '../../application/controller/controller/top_rated/top_rated.dart';
import '../../application/models/top_rated/top_rated.dart';

ValueNotifier<bool> scrollnotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<TopRated> toprated = [];
  List<Popular> popular = [];
  List<TensedDrama> tensedDrama = [];
  List<String> newplaying = [];
  List<TrendingNow> trendingNow = [];
  Future<void> getAllMovies() async {
    toprated = await getTopRatedMovies();
    trendingNow = await getTrendingNowMovies();
    popular = await getPopularMovies();
    tensedDrama = await getTensedDramaMovies();
  }

  @override
  void initState() {
    getAllMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollnotifier,
            builder: (context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;

                  if (direction == ScrollDirection.reverse) {
                    scrollnotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollnotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        const BackgroundCard(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MainTitleCard(
                              title: 'Released in the past year',
                              imageUrl: toprated),
                        ),
                        h10,
                        MainTitleCard(
                            title: 'Trending Now', imageUrl: trendingNow),
                        
                        h10,
                         NumberTitleCard(popular: popular),
                        h10,
                        MainTitleCard(title: 'Tensed Drama', imageUrl: tensedDrama),
                        
                        h10,
                        MainTitleCard(title: 'South Indian Cinemas', imageUrl: toprated)
                        // SouthIndianCinemaSection(),
                      ],
                    ),
                    scrollnotifier.value == true
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 1200),
                            color: Colors.black.withOpacity(0.3),
                            width: double.infinity,
                            height: 80,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      'https://www.freepnglogos.com/uploads/netflix-logo-app-png-16.png',
                                      fit: BoxFit.cover,
                                      width: 50,
                                      height: 50,
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.cast,
                                      color: whiteColor,
                                      size: 30,
                                    ),
                                    w10,
                                    Container(
                                      color: blueColor,
                                      width: 30,
                                      height: 30,
                                    ),
                                    w10
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'TV Shows',
                                      style: homeTitleText,
                                    ),
                                    Text(
                                      'Movies',
                                      style: homeTitleText,
                                    ),
                                    Text(
                                      "Categories",
                                      style: homeTitleText,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        : h10
                  ],
                ),
              );
            }));
  }
}
