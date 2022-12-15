import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/popular_tv_shows/popular_tv_show_loading_list.dart';
import 'package:mo3tv/features/tv/presentation/widgets/popular_tv_shows/popular_tv_shows_list.dart';

class PopularTvShows extends StatelessWidget {

  const PopularTvShows({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TvCubit, TvStates>(
      listener: (context, state) {},
      builder: (context, state) {
        TvCubit cubit = BlocProvider.of<TvCubit>(context);
        if(cubit.popularTvShows!=null) {
          return PopularTvShowsList(popularTvShows: cubit.popularTvShows!,);
        }
        if(cubit.popularTvShows==null){
          return const PopularTvShowsLoadingList();
        }
        return SliverToBoxAdapter(child: Container());
      },
    );
  }
}






