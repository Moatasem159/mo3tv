import 'package:flutter/material.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_info_widgets/creator_widget.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_info_widgets/season_number_widget.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_info_widgets/status_widget.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_info_widgets/tv_show_name.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_info_widgets/tv_show_tagline.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_info_widgets/type_widget.dart';
class TvShowInfoWidget extends StatelessWidget {
  final TvShow tvShow;
  const TvShowInfoWidget({super.key,required this.tvShow});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TvShowName(name:tvShow.originalName!,firstAirDate: tvShow.firstAirDate!),
          TvShowTagline(tagline: tvShow.tagline!),
          SeasonNumberWidget(tvShow: tvShow),
          StatusWidget(status:  tvShow.status!),
          TypeWidget(type:tvShow.type!),
          CreatorWidget(tvShow: tvShow),
        ],
      ),
    );
  }
}