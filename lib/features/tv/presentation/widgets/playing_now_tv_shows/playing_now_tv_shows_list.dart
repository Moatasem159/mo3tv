import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/playing_now_tv_shows/playing_now_tv_show_widget.dart';

class PlayingNowTvShowsList extends StatelessWidget {
  final List<TvShow> tvShows;
  final double height;
  final double width;
  final double iconSize;
  final double playingSize;
  final double titleSize;

  const PlayingNowTvShowsList(
      {Key? key,
        required this.tvShows,
        required this.height,
        required this.width,
        required this.iconSize,
        required this.playingSize,
        required this.titleSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: CarouselSlider(
        options: CarouselOptions(
          height: height,
          viewportFraction: 1,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
        ),
        items:tvShows.map(
              (tvShow) =>
                  PlayingNowTvShowWidget(
                  tvShow: tvShow,
                  imageHeight: height,
                  imageWidth: width,
                  iconSize: iconSize,
                  playingSize: playingSize,
                  titleSize: titleSize),
        ).toList(),
      ),
    );
  }
}