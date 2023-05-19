import 'package:flutter/material.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_description_widgets/season_list_widget.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_description_widgets/tv_show_keywords.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_description_widgets/tv_show_overview_text.dart';
class TvShowDescriptionWidget extends StatelessWidget {
  final TvShow tvShow;
  const TvShowDescriptionWidget({super.key, required this.tvShow});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TvShowOverviewText(overview:tvShow.overview!),
        SeasonsListWidget(tvShow:tvShow),
        TvShowKeywords(keywords:tvShow.keywords!),
      ],
    );
  }
}