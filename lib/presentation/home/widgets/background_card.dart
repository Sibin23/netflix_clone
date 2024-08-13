import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'https://30namachi51.top/wp-content/uploads/2023/08/tt4495098.jpg',
                     // 'https://images.hdqwalls.com/download/stranger-things-season-5-uw-1280x2120.jpg',
                      ),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high)),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                  icon: Icons.add,
                  title: 'My List',
                ),
                _playButton(),
                const CustomButtonWidget(icon: Icons.info, title: 'Info')
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          size: 30,
          color: blackColor,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Play',
            style: TextStyle(fontSize: 20, color: blackColor),
          ),
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)))),
            backgroundColor: MaterialStateProperty.all(whiteColor)));
  }
}
