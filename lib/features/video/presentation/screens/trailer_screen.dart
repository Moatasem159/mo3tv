import 'package:flutter/material.dart';
import 'package:mo3tv/features/video/presentation/widgets/youtube_video_player.dart';
class TrailerScreen extends StatelessWidget {
  final String url;
  final String title;
  const TrailerScreen({Key? key, required this.url, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(title),
        ),
        backgroundColor: Colors.black,
        body: YoutubePlayerVideo(url: url, title: title),
      ),
    );
  }
}