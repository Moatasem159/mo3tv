import 'package:flutter/material.dart';
import 'package:mo3tv/features/media/presentation/widgets/trailer_widgets/youtube_video_player.dart';
class TrailerScreen extends StatelessWidget {
  final String url;
  final String title;
  const TrailerScreen({super.key, required this.url, required this.title});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:Theme.of(context).appBarTheme.backgroundColor,
          title: Text(title),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: YoutubePlayerVideo(url: url, title: title),
      ),
    );
  }
}