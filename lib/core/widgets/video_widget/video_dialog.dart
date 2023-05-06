import 'package:flutter/material.dart';
import 'package:mo3tv/core/widgets/video_widget/youtube_video_player.dart';
class VideoDialog extends StatelessWidget {
  final String url;
  final String title;
  const VideoDialog({Key? key, required this.url, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(height:500,child: YoutubePlayerVideo(url: url,title: title),
      ),
    );
  }
}