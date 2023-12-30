import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_over_view_widgets/media_poster/media_poster.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_over_view_widgets/tv_show_info_widgets/tv_show_info_widget.dart';
import 'package:mo3tv/features/media/domain/entities/tv_show.dart';
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
            MediaPoster(image: tvShow.posterPath),
            5.pw,
            TvShowInfoWidget(tvShow: tvShow)
          ],
        ),
      ],
    ).addSymmetricPadding(h: 8,v: 5);
  }
}