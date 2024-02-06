import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_over_view_widgets/keywords_widgets/genres_widget.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_over_view_widgets/media_buttons/media_buttons_widget.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_over_view_widgets/tv_show_info_widgets/tv_show_details.dart';
import 'package:mo3tv/features/media/domain/entities/tv_show.dart';
import 'tv_show_description_widgets/tv_show_description_widget.dart';
class TvShowOverviewSuccessBody extends StatelessWidget {
  final String listType;
  final TvShow tvShow;
  const TvShowOverviewSuccessBody({super.key,required this.listType, required this.tvShow});
  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildListDelegate(
        [
      TvShowDetails(tvShow: tvShow),
      GenresWidget(genres: tvShow.genres,
          mediaType: AppStrings.tv,
          runTime: tvShow.episodeRunTime.isNotEmpty ? tvShow
              .episodeRunTime[0] : 0,link: tvShow.homepage),
      MediaButtonsWidget(listType: listType,movie:tvShow),
      TvShowDescriptionWidget(tvShow: tvShow)
    ]));
  }
}
