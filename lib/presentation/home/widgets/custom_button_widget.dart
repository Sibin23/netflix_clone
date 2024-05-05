import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({this.iconSize = 30,this.textSize = 18,
    super.key, required this.icon, required this.title,
  });
  final double iconSize;
  final double textSize;
final IconData icon;
final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon,color: whiteColor,size: iconSize),
        Text(title,style:  TextStyle(fontSize: textSize),)
      ],
    );
  }
}