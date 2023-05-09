import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/empty_recommendations_media_widget.dart';
import 'package:mo3tv/core/widgets/recommendations_media_loading_list.dart';
import 'package:mo3tv/features/movies/presentation/cubit/recommendations_movie_cubit/recommendations_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/recommendations_movie_cubit/recommendations_movie_state.dart';
import 'package:mo3tv/features/movies/presentation/widgets/recommendations/recommendations_movie_list.dart';
class RecommendationsMovies extends StatelessWidget {
  const RecommendationsMovies({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationsMovieCubit, RecommendationsMovieStates>(
      builder: (context, state) {
        if (state is GetMovieRecommendationsSuccessState && state.recMovies.isEmpty){
          return const RecommendationsMediaEmptyWidget(
            msg: "No recommendations",
            icon: Icons.movie_filter_outlined,
          );
        }
        if (state is GetMovieRecommendationsSuccessState) {
          return RecommendationsMoviesList(recommendationMovies:state.recMovies);
        }
        if (state is GetMovieRecommendationsLoadingState) {
          return const RecommendationsMediaLoadingList();
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}