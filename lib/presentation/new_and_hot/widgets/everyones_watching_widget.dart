import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/strings.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key, required this.title, required this.overview, required this.image,
  });
  final String title;
  final String overview;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        h10,
        Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        h10,
        Text(
          overview,
          style: TextStyle(color: greyColor),
        ),
        h50,
        VideoWidget(image: baseUrl + image,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
                icon: Icons.near_me_outlined, title: 'Share', textSize: 13),
            w10,
            CustomButtonWidget(icon: Icons.add, title: "My List", textSize: 13),
            w10,
            CustomButtonWidget(
                icon: Icons.play_arrow, title: "Play", textSize: 13),
            w10
          ],
        )
      ],
    );
  }
}