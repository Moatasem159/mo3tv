import 'package:flutter/material.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_screen_widgets/playing_now_tv_shows.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_screen_widgets/popular_tv_shows.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_screen_widgets/top_rated_tv_shows.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_screen_widgets/trending_tv_shows.dart';
class TvScreen extends StatelessWidget {
  const TvScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        PlayingNowTvShows(),
        TrendingTvShow(),
        PopularTvShow(),
        TopRatedTvShow(),
      ],
    );
  }
}