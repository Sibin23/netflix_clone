import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        h10,
        Text('Friends',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        h10,
        Text(
          'This hit sitcom follows the merry misadventures of six 20-something pals aa they navigate the pitfals of work, life and love in 1990s Manhattan',
          style: TextStyle(color: greyColor),
        ),
        h50,
        VideoWidget(image: 'https://getwalls.io/webp/large/MjAyMC8wOC9mcmllbmRzLXR2LXNob3ctZnJlZS1kZXNrdG9wLWJhY2tncm91bmRzLWxhcmdlLTE3MDIzNzQ4MTAuanBn.webp',),
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