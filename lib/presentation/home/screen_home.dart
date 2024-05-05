import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';
import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollnotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

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
                      children: const [
                        BackgroundCard(),
                        MainTitleCard(
                          title: 'Released in the past year',
                          imageUrl:
                              'https://resizing.flixster.com/hX6w5BAFk2uRflKaoB0e0riPDsc=/206x305/v2/https://resizing.flixster.com/mp662_hMit1v-dVNJsYDvTkxADw=/ems.cHJkLWVtcy1hc3NldHMvdHZzZWFzb24vUlRUVjgxMjU4My53ZWJw',
                        ),
                        h10,
                        MainTitleCard(
                          title: 'Trending Now',
                          imageUrl:
                              'https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/kingdom-of-the-planet-of-the-apes-et00374973-1699000754.jpg',
                        ),
                        h10,
                        NumberTitleCard(),
                        h10,
                        MainTitleCard(
                          title: 'Tense Dramas',
                          imageUrl:
                              'https://resizing.flixster.com/4h9bnkw0DZ98nBIorGmi2F_4zpk=/206x305/v2/https://resizing.flixster.com/O_7WBKqpbx-v2vGorZoDbwV2mto=/ems.cHJkLWVtcy1hc3NldHMvdHZzZXJpZXMvYTZiZDU4MTEtMmRjYS00MDNhLWFmM2QtYjJhOTU4MGE2OTZkLmpwZw==',
                        ),
                        h10,
                        MainTitleCard(
                          title: 'South Indian Cinemas',
                          imageUrl:
                              'https://m.media-amazon.com/images/M/MV5BOWMyNTA2M2UtMmZkNC00ZWE5LThjZGItODcxNGU2MDBhYTk1XkEyXkFqcGdeQXVyOTU0NjY5MzM@._V1_FMjpg_UX1000_.jpg',
                        ),
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
