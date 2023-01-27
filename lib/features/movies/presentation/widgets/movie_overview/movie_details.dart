import 'package:flutter/material.dart';
import 'package:mo3tv/core/widgets/genres_widget.dart';
import 'package:mo3tv/core/widgets/media_poster_widget.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_info.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  const MovieDetails({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MediaPosterWidget(poster: movie.posterPath!),
            const SizedBox(
              width: 5,
            ),
            MovieInfo(
              movie: movie,
            )
          ],
        ),
        const SizedBox(
          height: 5
        ),
        if (movie.genres!.isNotEmpty)
          GenresWidget(genres:movie.genres!,runTime: movie.runtime,isTvShow: false),
        const SizedBox(height: 15,)
      ],
    );
  }
}