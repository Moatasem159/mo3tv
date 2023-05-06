import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/tv/presentation/widgets/season_widgets/episodes_widgets/episodes_list.dart';
class SeasonOverviewWidget extends StatelessWidget {
  final TvShowSeason season;
  const SeasonOverviewWidget({Key? key, required this.season}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: Column(
        children: [
          10.ph,
          if (season.overview != "")
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                season.overview!,
                style: const TextStyle(
                    wordSpacing: 2,
                    fontWeight: FontWeight.w600,
                    height: 1.4),
              ),
            ),
           EpisodesList(episodes: season.episodes!)
        ],
      ),
    );
  }
}