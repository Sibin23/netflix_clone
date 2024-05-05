import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/main_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key, required this.title, required this.imageUrl,
  });
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       MainTitle(title: title),
       h10,
       LimitedBox(
        maxHeight: 200,
         child: ListView(
          scrollDirection: Axis.horizontal,
          children : List.generate(10, (index)=>  MainCard(image: imageUrl,))),
       )
      ],
    );
  }
}