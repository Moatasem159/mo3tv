import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/buttons/arrow_up_button.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
import 'package:mo3tv/features/movies/presentation/cubit/similar_movies_cubit/similar_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/similar_movies_cubit/similar_movie_state.dart';
import 'package:mo3tv/features/movies/presentation/widgets/similar_movies_widgets/similar_movies_screen_body.dart';
class SimilarMoviesScreen extends StatelessWidget {
  final List<Movie> recommendations;
  final int movieId;
  const SimilarMoviesScreen({super.key, required this.recommendations, required this.movieId});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarMovieCubit(di.sl())..movieId=movieId..movies.addAll(recommendations),
      child: BlocBuilder<SimilarMovieCubit, SimilarMovieStates>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              body: const SimilarMoviesScreenBody(),
              floatingActionButton: SimilarMovieCubit.get(context).showScrollButton
                  ? ArrowUpButton(onTap: () => SimilarMovieCubit.get(context).scrollingUp())
                  : null,
            ),
          );
        },
      ),
    );
  }
}