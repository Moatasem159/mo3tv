import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/similar_movies_widgets/similar_movies_screen_body.dart';
class SimilarMoviesScreen extends StatelessWidget {
  final List<Movie> recommendations;
  final int movieId;
  const SimilarMoviesScreen({Key? key, required this.recommendations, required this.movieId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Theme.of(context).colorScheme.background,
        body: SimilarMoviesScreenBody(recommendations: recommendations, movieId: movieId),
      ),
    );
  }
}