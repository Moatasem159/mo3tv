import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_screen_widgets/playing_now_tv_shows.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_screen_widgets/tv_shows_list.dart';
class TvScreen extends StatelessWidget {
  const TvScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        PlayingNowTvShows(),
        TvShowsList(index: 1,listType: AppStrings.trending,title: AppStrings.trendingTvShows),
        TvShowsList(index: 2,listType: AppStrings.popular,title: AppStrings.popularTvShows),
        TvShowsList(index: 3,listType: AppStrings.topRated,title: AppStrings.topRaredTvShows),
      ],
    );
  }
}