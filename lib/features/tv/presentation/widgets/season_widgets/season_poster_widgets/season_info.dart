import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
class SeasonInfo extends StatelessWidget {
  final TvShowSeason season;
  const SeasonInfo({super.key,required this.season});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      decoration:const BoxDecoration(
          color:Colors.black54,
          borderRadius:BorderRadius.vertical(bottom: Radius.circular(10))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(season.name!, style: AppTextStyles.get14BoldText(),
              textAlign: TextAlign.center),
          Text(
            season.airDate!=''?
            "${season.airDate!.substring(0,4)} | ${season.episodeCount} Episodes":
            "${season.episodeCount} Episodes",
            maxLines: null,
            overflow: TextOverflow.visible,
            style:AppTextStyles.get14BoldText()),
          3.ph
        ],
      ),
    );
  }
}