import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerVideo extends StatefulWidget {
  final String url;
  final String title;

  const YoutubePlayerVideo({Key? key, required this.url, required this.title}) : super(key: key);

  @override
  State<YoutubePlayerVideo> createState() => _YoutubePlayerVideoState();
}

class _YoutubePlayerVideoState extends State<YoutubePlayerVideo> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
      flags: const YoutubePlayerFlags(
        disableDragSeek: false,
        autoPlay: false),
    )..addListener(() {setState(() {});});


  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.white)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(
            controller: controller,
            progressColors: const ProgressBarColors(playedColor: Colors.red,backgroundColor: Colors.grey,handleColor: Colors.red),
            progressIndicatorColor: Colors.red,
            showVideoProgressIndicator: true,
            bottomActions: const[],

            topActions: const[],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.title,),
          ),
        ],
      ),
    );
  }
}
