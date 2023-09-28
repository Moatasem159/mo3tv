import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_poster/tv_show_poster_widget.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_info_widgets/tv_show_info_widget.dart';
class TvShowDetails extends StatelessWidget {
  final TvShow tvShow;
  const TvShowDetails({super.key,required this.tvShow});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        5.ph,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TvShowPosterWidget(tvShow: tvShow),
            5.pw,
            TvShowInfoWidget(tvShow: tvShow)
          ],
        ),
      ],
    ).addSymmetricPadding(h: 8,v: 5);
  }
}