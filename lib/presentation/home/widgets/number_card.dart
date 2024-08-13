import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/strings.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.image});
  final int index;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 50,
              height: 200,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 130,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: radius10,
                  image:  DecorationImage(
                      image: NetworkImage(baseUrl + image),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
        Positioned(
            left: 8,
            bottom: -30,
            child: BorderedText(
              strokeWidth: 10.0,
              strokeColor: whiteColor,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: blackColor,
                  fontSize: 110,
                  decoration: TextDecoration.none,
                ),
              ),
            ))
      ],
    );
  }
}
