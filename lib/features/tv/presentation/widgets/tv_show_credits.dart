import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/core/widgets/credits/media_credits_list.dart';
import 'package:mo3tv/core/widgets/credits/media_credits_loading_list.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
class TvShowCredits extends StatelessWidget {
  const TvShowCredits({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvCubit, TvStates>(
      builder: (context, state) {
        TvCubit cubit = TvCubit.get(context);
        if (cubit.tvShowCredits!.isNotEmpty) {
          return MediaCreditsList(mediaCredits: cubit.tvShowCredits!);
        }
        if (state is GetMovieRecommendationsLoadingState || cubit.tvShowCredits!.isEmpty) {
          return const MediaCreditsLoadingList();
        }
        return SliverToBoxAdapter(
          child: Container(),
        );
      },
    );
  }
}