import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/top_rated_tv_shows/top_rated_tv_shows_list.dart';
import 'package:mo3tv/features/tv/presentation/widgets/top_rated_tv_shows/top_rated_tv_shows_loading_list.dart';

class TopRatedTvShows extends StatelessWidget {
  const TopRatedTvShows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TvCubit, TvStates>(
      listener: (context, state) {},
      builder: (context, state) {
        TvCubit cubit = BlocProvider.of<TvCubit>(context);
        if(cubit.topRatedTvShows!=null)
          {
            return TopRatedTvShowsList(topRatedTvShow:cubit.topRatedTvShows!);
          }
        if(cubit.topRatedTvShows==null)
          {
            return const TopRatedTvShowLoadingList();
          }
        return SliverToBoxAdapter(child: Container());

      },
    );
  }
}




