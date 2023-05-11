import 'package:flutter/material.dart';
import 'package:mo3tv/core/entities/video.dart';
import 'package:mo3tv/core/widgets/video_widget/play_media_trailer.dart';
class MovieTrailerWidget extends StatelessWidget {
  const MovieTrailerWidget({super.key,required this.trailer});
  final Video ?trailer;
  @override
  Widget build(BuildContext context) {
    if (trailer != null) {
      return PlayMediaTrailer(
        url: trailer!.key!,
        title: trailer!.name!,
      );
    }
    return Container();
  }
}