import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/playing_now_tv_shows/playing_now_tv_show_card.dart';
class PlayingNowTvShowCarousal extends StatelessWidget {
  final List<TvShow> tvShows;
  const PlayingNowTvShowCarousal({Key? key, required this.tvShows}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height/3.5,
        viewportFraction: .89,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
      ),
      items:tvShows.map((e)=>PlayingNowTvShowCard(tvShow: e,) ).toList(),
    );
  }
}