import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
class SeasonNumberWidget extends StatelessWidget {
  final TvShow tvShow;
  const SeasonNumberWidget({super.key,required this.tvShow});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (tvShow.seasons!.isEmpty && tvShow.numberOfSeasons == 1)
          Text("${tvShow.numberOfSeasons} Season",style: AppTextStyles.get14BoldText()),
        if (tvShow.seasons!.isEmpty && tvShow.numberOfSeasons! > 1)
          Text("${tvShow.numberOfSeasons} Seasons",style: AppTextStyles.get14BoldText()),
        if (tvShow.seasons!.length > 1)
          Text("${tvShow.seasons!.length} Seasons", style: AppTextStyles.get14BoldText()),
        if (tvShow.seasons!.length == 1)
          Text("${tvShow.seasons!.length} Season",style:AppTextStyles.get14BoldText()),
      ],
    );
  }
}