import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_over_view_widgets/media_poster/media_poster.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_over_view_widgets/movie_info_widgets/movie_info_widget.dart';
import 'package:mo3tv/features/media/domain/entities/movie.dart';
class MovieDetailsWidget extends StatelessWidget {
  final Movie movie;
  const MovieDetailsWidget({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        5.ph,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MediaPoster(image: movie.posterPath),
            5.pw,
            MovieInfoWidget(movie: movie)
          ],
        ),
      ],
    ).addSymmetricPadding(h:8,v:4);
  }
}