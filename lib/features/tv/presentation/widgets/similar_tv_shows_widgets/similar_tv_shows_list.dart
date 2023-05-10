import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/tv_show_sliver_list.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/similar_tv_shows_cubit/similar_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/similar_tv_shows_cubit/similar_tv_show_state.dart';
class SimilarTvShowsList extends StatelessWidget {
  final List<TvShow> recommendations;
  const SimilarTvShowsList({super.key, required this.recommendations});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarTvShowCubit, SimilarTvShowStates>(
      builder: (context, state) {
        SimilarTvShowCubit cubit = SimilarTvShowCubit.get(context);
        if (cubit.tvShows.isEmpty) {
          cubit.tvShows.addAll(recommendations);
        }
        return TvShowsSliverList(tvShows: cubit.tvShows);
      },
    );
  }
}