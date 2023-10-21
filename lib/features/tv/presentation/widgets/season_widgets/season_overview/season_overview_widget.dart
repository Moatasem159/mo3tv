import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/tv/presentation/widgets/season_widgets/episodes_widgets/episodes_list.dart';
class SeasonOverviewWidget extends StatelessWidget {
  final TvShowSeason season;
  const SeasonOverviewWidget({super.key, required this.season});
  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: Column(
        children: [
          10.ph,
          if (season.overview != "")
            Text(season.overview!,
                style:AppLocalizations.of(context)!.isEnLocale?
                AppTextStyles.get14NormalText():AppTextStyles.get18NormalText()).addAllPadding(8),
           EpisodesList(episodes: season.episodes!)
        ],
      ),
    );
  }
}