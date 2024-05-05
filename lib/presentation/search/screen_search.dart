import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/search/widgets/search_result.dart';

const imageUrl =
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.wallpaperflare.com%2Fsearch%3Fwallpaper%3Dfurious&psig=AOvVaw3VbI4ZSV_g_Gmb2Rz7qvJ4&ust=1713549517751000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCLDO_syrzIUDFQAAAAAdAAAAABAp';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            
            children: [
              CupertinoSearchTextField(
                backgroundColor: greyColor.withOpacity(0.4),
                prefixIcon: const Icon(CupertinoIcons.search, color: greyColor),
                style: const TextStyle(color: whiteColor),
                suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill,
                    color: greyColor),
              ),
              
              Expanded(child: const SearchResultWidget())
            ],
          ),
        ),
      ),
    );
  }
}
