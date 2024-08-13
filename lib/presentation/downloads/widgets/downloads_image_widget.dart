import 'dart:math';

import 'package:flutter/material.dart';

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    this.angle = 0,
    required this.image,
    required this.margin,
    required this.size,
  });

  final double angle;
  final String image;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
         
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image:
                  DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}