import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/strings.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
    required this.image,
    required this.title,
    required this.releaseDate,
    required this.overview,
  });
  final String image;
  final String title;
  final String releaseDate;
  final String overview;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(image: baseUrl + image),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 170,
                    child: Text(
                      title,
                      style: const TextStyle(
                          letterSpacing: -3,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  const Spacer(),
                  const Row(
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
              Text(releaseDate),
              h10,
              Text(title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              h10,
              SizedBox(
                width: size.width,
                height: 110,
                child: Text(
                  overview,
                  style: const TextStyle(
                      color: greyColor, overflow: TextOverflow.visible),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
