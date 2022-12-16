import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';


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
    controller =YoutubePlayerController.fromVideoId(
      videoId: YoutubePlayerController.convertUrlToId(widget.url)!,
      params:const YoutubePlayerParams(
        color: "red",
        showVideoAnnotations: false,
      ),
      autoPlay: false,
    );


  }

  @override
  void deactivate() {
    controller.pauseVideo();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.stopVideo();
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
      child: YoutubePlayerControllerProvider(
          controller: controller,
          child:SizedBox(
            height: 500,
            child: YoutubePlayer(
        controller:controller,
      ),
          )),
    );
  }
}
