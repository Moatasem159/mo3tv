import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/buttons/see_more_button.dart';
import 'package:mo3tv/core/widgets/sliver_loading_indicator.dart';
import 'package:mo3tv/features/movies/presentation/cubit/similar_movies_cubit/similar_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/similar_movies_cubit/similar_movie_state.dart';
class SimilarMoviesButton extends StatelessWidget {
  final int movieId;
  const SimilarMoviesButton({super.key, required this.movieId});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarMovieCubit, SimilarMovieStates>(
      builder: (context, state) {
        SimilarMovieCubit cubit = SimilarMovieCubit.get(context);
        if (state is GetSimilarMoviesLoadingState) {
          return const SliverLoadingIndicator();
        }
        if (state is GetSimilarMoviesSuccessState && cubit.allMovies) {
          return SliverToBoxAdapter(
            child: Column(
              children: [
                10.ph,
                const Center(
                    child: Text("No more movies",
                        style: TextStyle(fontWeight: FontWeight.w600))),
                20.ph
              ],
            ),
          );
        }
        return SeeMoreButton(
          onPressed: () {
            SimilarMovieCubit.get(context).getSimilarMovies(movieId: movieId);
          },
        );
      },
    );
  }
}