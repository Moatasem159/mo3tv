import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/entities/media.dart';
import 'package:mo3tv/core/widgets/media_playing_now/media_playing_now_card.dart';
class MediaPlayingNowCarousal extends StatelessWidget {
  final List<Media> media;
  final bool isMovie;
  const MediaPlayingNowCarousal({super.key, required this.media, required this.isMovie});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height/3.5,
        viewportFraction: .89,
        autoPlay:true,
        autoPlayInterval: const Duration(seconds: 3)),
      items:media.map((media)=>MediaPlayingNowCard(media:media,isMovie: isMovie)).toList());
  }
}