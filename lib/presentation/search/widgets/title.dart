import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';

class SearchTextTitle extends StatelessWidget {
  final String title;
  const SearchTextTitle({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: whiteColor, fontSize: 23, fontWeight: FontWeight.w700),
    );
  }
}
