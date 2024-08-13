import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        w10,
        Expanded(
            child: Text(title,
                style: GoogleFonts.montserrat(
                    fontSize: 30, fontWeight: FontWeight.w700))),
        IconButton(onPressed: () {}, icon: const Icon(Icons.cast, color: whiteColor)),
        w10,
        Container(
          color: blueColor,
          width: 25,
          height: 25,
        ),
        w10,
      ],
    );
  }
}
