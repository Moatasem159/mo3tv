import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_list.dart';
import 'package:mo3tv/features/tv/presentation/cubit/similar_tv_shows_cubit/similar_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/similar_tv_shows_cubit/similar_tv_show_state.dart';
class SimilarTvShowsList extends StatelessWidget {
  const SimilarTvShowsList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarTvShowCubit, SimilarTvShowStates>(
      builder: (context, state) {
        return TvList(tvList:SimilarTvShowCubit.get(context).tvShows);
      },
    );
  }
}