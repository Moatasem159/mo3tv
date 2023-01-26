import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_error.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_loading_list.dart';
import 'package:mo3tv/core/widgets/media_see_more/media_see_more.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/horizontal_tv_show_list.dart';

class TrendingTvShows extends StatelessWidget {

  const TrendingTvShows({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TvCubit, TvStates>(
      listener: (context, state) {},
      builder: (context, state) {
        TvCubit cubit = BlocProvider.of<TvCubit>(context);
        if(state is GetTrendingTvShowsLoadingState||cubit.trendingTvShows==null){
          return const MediaHorizontalLoadingList();
        }
        if(state is GetTrendingTvShowsErrorState||cubit.trendingTvShowError!) {
          return MediaHorizontalError(onPressed: () {
            cubit.getTrendingTvShowsData();
          },);
        }
        if(state is GetTrendingTvShowsSuccessState||cubit.trendingTvShows!=null) {
          return HorizontalTvShowsList(
            tvShows: cubit.trendingTvShows!,
            // title: "Trending series today",
            onPressed: () {
              cubit.seeMoreListTvShows.addAll(cubit.trendingTvShows!);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  const MediaSeeMore(title:"Trending series today",index: 1, ),
              ));
            },
          );
        }
        return SliverToBoxAdapter(child: Container());
      },
    );
  }
}






