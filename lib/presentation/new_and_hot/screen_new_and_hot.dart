import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

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
        body: TabBarView(
            children: [_buildComingSoon(), _buildEveryonesWatching()]),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const ComingSoonWidget());
  }

  Widget _buildEveryonesWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context,index)=> const EveryonesWatchingWidget());
  }
}


