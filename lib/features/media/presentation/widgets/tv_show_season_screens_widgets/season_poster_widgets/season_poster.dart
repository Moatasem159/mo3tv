import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/features/media/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/media/presentation/widgets/tv_show_season_screens_widgets/season_poster_widgets/season_info.dart';
import 'package:mo3tv/features/media/presentation/widgets/tv_show_season_screens_widgets/season_poster_widgets/season_poster_image.dart';
class SeasonPoster extends StatelessWidget {
  final TvShowSeason season;
  final int tvShowId;
  final String tvShowName;
  const SeasonPoster({super.key,
    required this.season, required this.tvShowId,
    required this.tvShowName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          Routes.seasonRoute,
          extra: season,
          pathParameters: {
            "listType":"?",
            "tvShowName": tvShowName,
            "tvShowId":tvShowId.toString(),
          },
        );
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          SeasonPosterImage(image: season.posterPath),
          SeasonInfo(season: season),
        ],
      ).addAllPadding(MediaQuery.of(context).size.width/43));
  }
}