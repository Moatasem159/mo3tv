import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/user_score_widget.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_buttons/add_movie_to_watchlist_button.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_buttons/movie_fav_button.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_buttons/movie_rating_button.dart';
class MovieButtonsWidget extends StatelessWidget {
  final Movie movie;
  const MovieButtonsWidget({super.key,required this.movie,});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        15.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            UserScoreWidget(vote: movie.voteAverage),
            const MovieFavButton(),
            const MovieRatingButton(),
            const AddMovieToWatchlistButton(),
          ],
        ),
      ],
    );
  }
}