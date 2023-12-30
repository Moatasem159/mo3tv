import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/media/domain/entities/episode.dart';
class EpisodeInfo extends StatelessWidget {
  final Episode episode;
  const EpisodeInfo({super.key,required this.episode});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          if (episode.name != "Episode ${episode.episodeNumber}")
            Text("${AppStrings.episode.tr(context)!} ${episode.episodeNumber}",style: AppTextStyles.get14BoldText(),),
          FittedBox(
              child: Text(episode.name, style: AppTextStyles.get14BoldText(),maxLines: null)),
          Text(episode.airDate, style:AppTextStyles.get14BoldText()),
          if(episode.runtime!=0)
            Text(
              "${episode.runtime ~/ 60 > 0 ? "${episode.runtime ~/ 60}h " : ''}${episode.runtime % 60==0?'':"${episode.runtime % 60}m"}",
              style: AppTextStyles.get14BoldText(),
            )
        ],
      ),
    );
  }
}