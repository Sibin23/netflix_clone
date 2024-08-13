import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/strings.dart';
import 'package:netflix_clone/application/models/popular/popular.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

class SearchIdeWidget extends StatelessWidget {
  final List<Popular> popular;
  const SearchIdeWidget({super.key, required this.popular});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Top Searches',
        ),
        h10,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) => TopSearchItemTile(
                  image: popular[index].imagePath, title: popular[index].title),
              separatorBuilder: (ctx, index) => h20,
              itemCount: 10),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String image;
  final String title;
  const TopSearchItemTile(
      {super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 70,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(baseUrl + image), fit: BoxFit.cover)),
        ),
        w10,
        Expanded(
            child: Text(
          title,
          style: const TextStyle(
              color: whiteColor, fontSize: 16, fontWeight: FontWeight.bold),
        )),
        const CircleAvatar(
          backgroundColor: whiteColor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: blackColor,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: whiteColor,
            ),
          ),
        )
      ],
    );
  }
}
