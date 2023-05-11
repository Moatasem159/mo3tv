import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/buttons/error_button.dart';
import 'package:mo3tv/core/widgets/empty_recommendations_media_widget.dart';
import 'package:mo3tv/core/widgets/media_loading/recommendations_media_loading_list.dart';
import 'package:mo3tv/features/tv/presentation/cubit/recommendations_tv_cubit/recommendations_tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/recommendations_tv_cubit/recommendations_tv_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/recommendations/recommendations_tv_list.dart';
class RecommendationsTvShows extends StatelessWidget {
  final int tvId;
  const RecommendationsTvShows({Key? key, required this.tvId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationsTvCubit, RecommendationsTvStates>(
      builder: (context, state) {
        if (state is GetTvShowRecommendationsLoadingState) {
          return const RecommendationsMediaLoadingList();
        }
        if (state is GetTvShowRecommendationsSuccessState && state.tvShows.isEmpty){
          return const RecommendationsMediaEmptyWidget(
            msg: "No recommendations",
            icon: Icons.tv_off,
          );
        }
        if (state is GetTvShowRecommendationsSuccessState) {
          return RecommendationsTvShowsList(recommendationTvShows:state.tvShows,tvId: tvId);
        }
        if(state is GetTvShowRecommendationsErrorState){
          return SliverToBoxAdapter(
            child: ErrorButton(onTap: (){
              RecommendationsTvCubit.get(context).getTvShowsRecommendations(tvId: tvId);
            }),
          );
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}