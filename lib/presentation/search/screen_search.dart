import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/application/controller/controller/popular/popular.dart';
import 'package:netflix_clone/application/models/popular/popular.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/search_result.dart';

import 'widgets/search_idle.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  final _controller = TextEditingController();
  List<Popular> popular = [];
  bool _isTaped = true;
  bool isLoading = true;
  bool isError = false;
  Future getPopular() async {
    popular = await getPopularMovies();
    try {
      List<Popular> movies = await getPopularMovies();

      if (mounted) {
        setState(() {
          popular = movies;

          isLoading = false;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching upcoming movies: $e');
      }
      if (mounted) {
        setState(() {
          isError = true;
          isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    getPopular();
    _controller.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : isError
                ? const Center(
                    child: Text('Error fetching Movies'),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        CupertinoSearchTextField(
                          onChanged: (value) {
                            setState(() {
                              value.isEmpty
                                  ? _isTaped = true
                                  : _isTaped = false;
                            });
                          },
                          backgroundColor: greyColor.withOpacity(0.4),
                          prefixIcon: const Icon(CupertinoIcons.search,
                              color: greyColor),
                          style: const TextStyle(color: whiteColor),
                          suffixIcon: const Icon(
                              CupertinoIcons.xmark_circle_fill,
                              color: greyColor),
                        ),
                        h10,
                        _isEmpty(_controller.text),
                      ],
                    ),
                  ),
      ),
    );
  }

  Widget _isEmpty(String value) {
    return _isTaped
        ? Expanded(
            child: SearchIdeWidget(
            popular: popular,
          ))
        : const Expanded(child: SearchResultWidget());
  }
}
