import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_screen_widgets/popular_tv_shows.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_screen_widgets/top_rated_tv_shows.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_screen_widgets/trending_tv_shows.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_screen_widgets/playing_now_tv_shows/playing_now_tv_shows.dart';
class TvScreenBody extends StatelessWidget {
  const TvScreenBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children:[
          30.ph,
          const PlayingNowTvShowsWidget(),
          15.ph,
          const TrendingTvShow(),
          const PopularTvShow(),
          const TopRatedTvShow(),
          65.ph
        ],
      ),
    );
  }
}