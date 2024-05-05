import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        const SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'FEB',
                style: TextStyle(fontSize: 18, color: greyColor),
              ),
              Text(
                '11',
                style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                  image:
                      'https://wallpapers.com/images/hd/hd-white-walker-of-game-of-thrones-us0p9v0u09ihq7d7.webp'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 170,
                    child: Text(
                      'Game Of Thrones',
                      style: TextStyle(
                          letterSpacing: -3,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.notifications_none_rounded,
                        title: 'Remind Me',
                        iconSize: 25,
                        textSize: 13,
                      ),
                      w10,
                      CustomButtonWidget(
                        icon: Icons.info_outline,
                        title: 'Info',
                        iconSize: 25,
                        textSize: 13,
                      ),
                      w10,
                    ],
                  )
                ],
              ),
              h10,
              Text('Coming on Friday'),
              h10,
              Text('Game of Thrones',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              h10,
              Text(
                'Landing the lead in the school musical is a dream come true for Jodi, until the pressure sends her confidence--and her relationship--into a tailspin.',
                style: TextStyle(color: greyColor),
              )
            ],
          ),
        ),
      ],
    );
  }
}
