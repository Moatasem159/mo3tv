import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/empty_recommendations_media_widget.dart';
import 'package:mo3tv/core/widgets/recommendations_media_loading_list.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/recommendations/recommendations_tv_list.dart';

class RecommendationsTvShows extends StatelessWidget {
  const RecommendationsTvShows({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvCubit, TvStates>(
      builder: (context, state) {
        TvCubit cubit = TvCubit.get(context);
        if (cubit.tvRecommendations != null && cubit.tvRecommendations!.isNotEmpty) {
          return RecommendationsTvShowsList(recommendationTvShows: cubit.tvRecommendations!);
        }
        if (cubit.tvRecommendations == null||(state is GetTvShowRecommendationsLoadingState &&
            cubit.tvRecommendations!.isEmpty)) {
          return const RecommendationsMediaLoadingList();
        }
        if (state is GetTvShowRecommendationsSuccessState &&
            cubit.tvRecommendations!.isEmpty) {
          return const RecommendationsMediaEmptyWidget(
            msg: "No recommendations",
            icon: Icons.tv_off,
          );
        }
        return SliverToBoxAdapter(child: Container());
      },
    );
  }
}







