import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/media_poster_widget.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_info.dart';
class TvShowDetailsBody extends StatelessWidget {
  final TvShow tvShow;
  const TvShowDetailsBody({Key? key, required this.tvShow}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MediaPosterWidget(poster: tvShow.posterPath!),
           5.pw,
            TvShowInfo(tvShow: tvShow)
          ],
        ),
        5.ph
      ],
    );
  }
}