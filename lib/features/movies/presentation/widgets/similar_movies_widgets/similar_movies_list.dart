import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movies_sliver_list.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/similar_movies_cubit/similar_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/similar_movies_cubit/similar_movie_state.dart';

class SimilarMoviesList extends StatelessWidget {
  final List<Movie> recommendations;
  const SimilarMoviesList({super.key, required this.recommendations});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarMovieCubit, SimilarMovieStates>(
      builder: (context, state) {
        SimilarMovieCubit cubit = SimilarMovieCubit.get(context);
        if (cubit.movies.isEmpty) {
          cubit.movies.addAll(recommendations);
        }
        return MoviesSliverList(movies: cubit.movies);
      },
    );
  }
}