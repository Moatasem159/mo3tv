import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/widgets/keywords_widgets/genres_widget.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_buttons/tv_show_buttons_widget.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_description_widgets/tv_show_description_widget.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_details.dart';
class TvShowOverviewSuccessBody extends StatelessWidget {
  final String listType;
  final TvShow tvShow;
  const TvShowOverviewSuccessBody({super.key,required this.listType, required this.tvShow});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          TvShowDetails(tvShow: tvShow),
          GenresWidget(genres: tvShow.genres!,
              runTime: tvShow.episodeRunTime!.isNotEmpty ? tvShow
                  .episodeRunTime![0] : 0),
          TvShowButtonsWidget(tvShow: tvShow,listType:listType),
          TvShowDescriptionWidget(tvShow: tvShow)
        ],
      ).addSymmetricPadding(h: 8));
  }
}