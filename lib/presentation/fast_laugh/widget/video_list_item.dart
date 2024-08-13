import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatefulWidget {
  final int index;
  final String videoUrl;
  const VideoListItem({super.key, required this.index, required this.videoUrl});

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  late VideoPlayerController _videoPlayerController;
  bool isVolume = true;
  bool isPlay = true;
  @override
  void initState() {
    videoController(videoPath: videoPathList[widget.index]);
    super.initState();
  }

  void videoController({required String videoPath}) {
    // ignore: deprecated_member_use
    _videoPlayerController = VideoPlayerController.network(videoPath);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
        onPageChanged: (value) {
          setState(() {
            _videoPlayerController.dispose();
          });
          videoController(videoPath: videoPathList[value]);
        },
        children: List.generate(videoPathList.length, (index) {
          return Stack(
            children: [
              _videoPlayerController.value.isInitialized
                  ? Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _videoPlayerController.value.isPlaying
                                ? _videoPlayerController.play()
                                : _videoPlayerController.pause();
                          });
                        },
                        child: AspectRatio(
                            aspectRatio:
                                _videoPlayerController.value.aspectRatio,
                            child: VideoPlayer(_videoPlayerController)),
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left Side
                      CircleAvatar(
                          backgroundColor: blackColor.withOpacity(0.5),
                          radius: 20,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isVolume = !isVolume;
                                });
                              },
                              icon: const Icon(Icons.volume_down_rounded,
                                  color: whiteColor))),
                      // Right Side
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    'https://wallpapercave.com/wp/wp1975616.jpg')),
                          ),
                          const VideoActionWidget(
                              icon: Icons.emoji_emotions, title: 'LOL'),
                          const VideoActionWidget(
                              icon: Icons.add, title: 'My List'),
                          const VideoActionWidget(
                              icon: Icons.share, title: 'Share'),
                          VideoActions(
                              icon: !isPlay
                                  ? CupertinoIcons.play_circle
                                  : CupertinoIcons.pause_circle,
                              title: !isPlay ? 'Play' : 'Pause',
                              onPress: () {
                                setState(() {
                                  isPlay = !isPlay;
                                  _videoPlayerController.value.isPlaying
                                      ? _videoPlayerController.pause()
                                      : _videoPlayerController.play();
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        }));
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(icon, color: whiteColor),
          Text(
            title,
            style: const TextStyle(color: whiteColor, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class VideoActions extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function()? onPress;

  const VideoActions(
      {super.key, required this.icon, required this.title, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
          )
        ],
      ),
    );
  }
}

List<String> videoPathList = [
  "https://assets.mixkit.co/videos/1186/1186-720.mp4",
  "https://assets.mixkit.co/videos/1191/1191-720.mp4",
  "https://assets.mixkit.co/videos/1197/1197-720.mp4",
  "https://assets.mixkit.co/videos/1185/1185-720.mp4",
  "https://assets.mixkit.co/videos/1188/1188-720.mp4",
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
];

String imageUrl =
    'https://www.horror.land/wp-content/gallery/teal-and-orange/Jumper-2008-Poster-V1.jpg';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: VideoListItem(index: 0, videoUrl: videoPathList[0]),
    ),
  ));
}
