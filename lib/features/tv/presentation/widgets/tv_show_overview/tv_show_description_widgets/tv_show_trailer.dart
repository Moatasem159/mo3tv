import 'package:flutter/material.dart';
import 'package:mo3tv/core/entities/video.dart';
import 'package:mo3tv/core/widgets/play_media_trailer.dart';

class TvShowTrailer extends StatelessWidget {
  final Video? trailer;
  const TvShowTrailer({super.key,required this.trailer});
  @override
  Widget build(BuildContext context) {
    if (trailer != null) {
      return PlayMediaTrailer(url: trailer!.key!, title: trailer!.name!);
    }
    return Container();
  }
}