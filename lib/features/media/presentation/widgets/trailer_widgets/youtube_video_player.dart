import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class YoutubePlayerVideo extends StatefulWidget {
  final String url;
  final String title;
  const YoutubePlayerVideo({super.key, required this.url, required this.title});
  @override
  State<YoutubePlayerVideo> createState() => _YoutubePlayerVideoState();
}
class _YoutubePlayerVideoState extends State<YoutubePlayerVideo> {
  late final YoutubePlayerController controller;
  @override
  void initState() {
    super.initState();
    controller =YoutubePlayerController(
      initialVideoId:widget.url,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        showLiveFullscreenButton: false,
      ),
    );
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
    return Center(
        child: YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.red,
            liveUIColor: Colors.red,
            bottomActions: [
              CurrentPosition(controller: controller),
              ProgressBar(isExpanded: true, controller: controller),
              RemainingDuration(controller: controller),
              PlaybackSpeedButton(controller: controller),
            ],
            progressColors: const ProgressBarColors(
                playedColor: Colors.red, handleColor: Colors.red)));
  }
}