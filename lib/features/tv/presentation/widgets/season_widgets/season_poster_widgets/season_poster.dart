import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/widgets/season_widgets/season_poster_widgets/season_info.dart';
import 'package:mo3tv/features/tv/presentation/widgets/season_widgets/season_poster_widgets/season_poster_image.dart';
class SeasonPoster extends StatelessWidget {
  final TvShowSeason season;
  final int tvShowId;
  final String tvShowName;
  const SeasonPoster({Key? key,
    required this.season, required this.tvShowId,
    required this.tvShowName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        TvCubit.get(context).getTvShowSeasonDetailsData(
            tvShowId: tvShowId, seasonNumber: season.seasonNumber!);
        GoRouter.of(context).pushNamed(
          Routes.seasonRoute,
          extra: season,
          queryParameters: {"tvShowName": tvShowName},
        );
      },
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width/43),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            SeasonPosterImage(image: season.posterPath!),
            SeasonInfo(season: season),
          ],
        ),
      ),
    );
  }
}