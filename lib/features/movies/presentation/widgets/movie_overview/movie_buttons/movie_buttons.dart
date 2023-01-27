import 'package:flutter/material.dart';
import 'package:mo3tv/core/widgets/user_score_widget.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_buttons/add_movie_to_watchlist_button.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_buttons/movie_fav_button.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_buttons/movie_rating_button.dart';
class MovieButtons extends StatelessWidget {
  final Movie movie;
  const MovieButtons({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        UserScoreWidget(vote:movie.voteAverage),
        MovieFavButton(movie: movie),
        MovieRatingButton(movie: movie,),
        AddMovieToWatchlistButton(movie: movie),
      ],
    );
  }
}