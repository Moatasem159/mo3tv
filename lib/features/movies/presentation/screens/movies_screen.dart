import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_screen_widgets/playing_now_movies.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_screen_widgets/popular_movies.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_screen_widgets/top_rated_movies.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_screen_widgets/trending_movies.dart';
class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        PlayingNowMovies(),
        TrendingMovies(),
        PopularMovies(),
        TopRatedMovies(),
      ],
    );
  }
}