import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/empty_recommendations_media_widget.dart';
import 'package:mo3tv/core/widgets/recommendations_media_loading_list.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/features/movies/presentation/widgets/recommendations/recommendations_movie_list.dart';

class RecommendationsMovies extends StatelessWidget {
  const RecommendationsMovies({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        MovieCubit cubit = BlocProvider.of<MovieCubit>(context);
        if (cubit.movieRecommendations != null && cubit.movieRecommendations!.isNotEmpty) {
          return RecommendationsMoviesList(recommendationMovies: cubit.movieRecommendations!);
        }
        if (cubit.movieRecommendations == null||(state is GetMovieRecommendationsLoadingState &&
            cubit.movieRecommendations!.isEmpty)) {
          return const RecommendationsMediaLoadingList();
        }
        if (state is GetMovieRecommendationsSuccessState &&
            cubit.movieRecommendations!.isEmpty) {
          return const RecommendationsMediaEmptyWidget(
            msg: "No recommendations",
            icon: Icons.movie_filter_outlined,
          );
        }
        return SliverToBoxAdapter(child: Container());
      },
    );
  }
}







