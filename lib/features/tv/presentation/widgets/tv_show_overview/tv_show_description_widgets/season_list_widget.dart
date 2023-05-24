import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/season_widgets/season_poster_widgets/season_poster.dart';
class SeasonsListWidget extends StatelessWidget {
  final TvShow tvShow;
  const SeasonsListWidget({super.key, required this.tvShow});
  @override
  Widget build(BuildContext context) {
    if (tvShow.seasons!.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10),
             child: Text("Seasons:",style: AppTextStyles.get14BoldText())),
         Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: tvShow.seasons!.map((e) {
              return SeasonPoster(season: e,tvShowId: tvShow.id!,tvShowName: tvShow.originalName!);
            }).toList(),
          )
        ],
      );
    }
    return Container();
  }
}