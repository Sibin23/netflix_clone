import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key, required this.image,
  });
final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration:  BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      image),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: CircleAvatar(
              backgroundColor: blackColor.withOpacity(0.5),
              radius: 22,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.volume_off_rounded,
                      color: whiteColor))),
        ),
      ],
    );
  }
}