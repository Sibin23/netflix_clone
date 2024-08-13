import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/downloads/widgets/downloads_image_widget.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final _widgetList = [const _SmartDownloads(), Section2(), const Section3()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: 'Downloads',
            )),
        body: SafeArea(
            child: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemCount: _widgetList.length,
          itemBuilder: (context, index) => _widgetList[index],
          separatorBuilder: (context, index) => h20,
        )));
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        w10,
        Icon(Icons.settings, color: whiteColor),
        w10,
        Text(
          'Smart Downloads',
          style: TextStyle(
              color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final List imageList = [
    'https://i.pinimg.com/originals/57/e0/18/57e0188e118b23d3d026b8519001f5a4.jpg',
    'https://wallpapercave.com/wp/wp1975616.jpg',
    'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/09e20adc-4256-4c77-8465-3fe5c2e09840/dg82q2u-d417d6a5-91a6-43f6-a971-ad044de9f569.png/v1/fill/w_788,h_1015,q_70,strp/one_piece_netflix___live_action_poster_by_dreamerdesignoficial_dg82q2u-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTMyOCIsInBhdGgiOiJcL2ZcLzA5ZTIwYWRjLTQyNTYtNGM3Ny04NDY1LTNmZTVjMmUwOTg0MFwvZGc4MnEydS1kNDE3ZDZhNS05MWE2LTQzZjYtYTk3MS1hZDA0NGRlOWY1NjkucG5nIiwid2lkdGgiOiI8PTEwMzEifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.OLYRuy56TPjt7L8vLUkGfxg151T0H0JgOR2HmzyopeM',
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(children: [
      const Text(
        'Introducing Downloads for you',
        style: TextStyle(
            color: whiteColor, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      h10,
      const Text(
        textAlign: TextAlign.center,
        'We\'ll download a personalised selection of\nmovies and shows for you, so there\'s\nalways something to watch on your \ndevice',
        style: TextStyle(color: greyColor, fontSize: 16),
      ),
      SizedBox(
        width: size.width,
        height: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: greyColor.withOpacity(0.5),
                radius: size.width * .37,
              ),
            ),
            DownloadsImageWidget(
                image: imageList[0],
                margin: const EdgeInsets.only(left: 170),
                angle: 10,
                size: Size(size.width * .35, size.width * .48)),
            DownloadsImageWidget(
                image: imageList[1],
                margin: const EdgeInsets.only(right: 170),
                angle: -10,
                size: Size(size.width * .35, size.width * .48)),
            DownloadsImageWidget(
                image: imageList[2],
                margin: const EdgeInsets.all(0),
                size: Size(size.width * .4, size.width * .55))
          ],
        ),
      ),
    ]);
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            color: blueColor,
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set up',
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: whiteColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        h10,
        MaterialButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          color: whiteColor,
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: GoogleFonts.roboto(
                  fontSize: 20, color: blackColor, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
