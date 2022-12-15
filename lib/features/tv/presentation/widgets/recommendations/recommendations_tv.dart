import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/presentation/widgets/recommendations/recommendations_movie_empty.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/recommendations/recommendations_tv_list.dart';
import 'package:mo3tv/features/tv/presentation/widgets/recommendations/recommendations_tv_loading_list.dart';

class RecommendationsTvShows extends StatelessWidget {
  const RecommendationsTvShows({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TvCubit, TvStates>(
      listener: (context, state) {},
      builder: (context, state) {
        TvCubit cubit = BlocProvider.of<TvCubit>(context);
        if (cubit.tvRecommendations != null && cubit.tvRecommendations!.isNotEmpty) {
          return RecommendationsTvShowsList(recommendationTvShows: cubit.tvRecommendations!);
        }
        if (state is GetTvShowRecommendationsLoadingState ||
            cubit.tvRecommendations == null||cubit.tvRecommendations!.isEmpty) {
          return const RecommendationsTvShowsLoadingList();
        }
        if (state is GetTvShowRecommendationsSuccessState &&
            cubit.tvRecommendations!.isEmpty) {
          return const RecommendationsEmpty();
        }
        return SliverToBoxAdapter(child: Container());
      },
    );
  }
}







