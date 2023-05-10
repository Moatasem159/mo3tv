import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:mo3tv/core/widgets/empty_recommendations_media_widget.dart';
import 'package:mo3tv/core/widgets/recommendations_media_loading_list.dart';
import 'package:mo3tv/features/movies/presentation/cubit/recommendations_movie_cubit/recommendations_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/recommendations_movie_cubit/recommendations_movie_state.dart';
import 'package:mo3tv/features/movies/presentation/widgets/recommendations/recommendations_movie_list.dart';
class RecommendationsMovies extends StatelessWidget {
  final int movieId;
  const RecommendationsMovies({Key? key, required this.movieId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BlocBuilder<RecommendationsMovieCubit, RecommendationsMovieStates>(
            builder: (context, state) {
              if (state is GetMovieRecommendationsLoadingState) {
                return const RecommendationsMediaLoadingList();
              }
              if (state is GetMovieRecommendationsSuccessState && state.recMovies.isEmpty){
                return const RecommendationsMediaEmptyWidget(
                  msg: "No recommendations",
                  icon: Icons.movie_filter_outlined,
                );
              }
              if (state is GetMovieRecommendationsSuccessState) {
                return RecommendationsMoviesList(recommendationMovies:state.recMovies,movieId:movieId);
              }
              if(state is GetMovieRecommendationsErrorState){
                return SliverToBoxAdapter(
                  child: ErrorButton(onTap: (){
                    RecommendationsMovieCubit.get(context).getMovieRecommendations(movieId:movieId);
                  }),
                );
              }
              return const SliverToBoxAdapter();
            },
          );
      }
    );
  }
}