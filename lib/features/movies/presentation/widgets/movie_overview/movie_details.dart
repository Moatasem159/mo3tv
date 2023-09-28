import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_info_widgets/movie_info_widget.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_poster/movie_poster_widget.dart';
class MovieDetailsWidget extends StatelessWidget {
  final Movie movie;
  const MovieDetailsWidget({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        5.ph,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MoviePosterWidget(movie: movie),
            5.pw,
            MovieInfoWidget(movie: movie)
          ],
        ),
      ],
    ).addSymmetricPadding(h:8,v:4);
  }
}