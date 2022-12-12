import 'package:flutter/material.dart';
import 'package:mo3tv/core/widgets/video_widget/youtube_video_player.dart';
import 'package:mo3tv/features/movies/domain/entities/video.dart';

class MovieVideosList extends StatelessWidget {
  final  List<Video> movieVideos;
  const MovieVideosList({Key? key, required this.movieVideos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount:movieVideos.length,
      itemBuilder: (context, index) {
        return YoutubePlayerVideo(
          url:movieVideos[index].key!,
          title:movieVideos[index].name!,
        );
      },
    );
  }
}