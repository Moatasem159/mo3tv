import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_error.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_loading_list.dart';
import 'package:mo3tv/core/widgets/media_see_more/media_see_more.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/horizontal_tv_show_list.dart';

class PopularTvShows extends StatelessWidget {

  const PopularTvShows({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TvCubit, TvStates>(
      listener: (context, state) {},
      builder: (context, state) {
        TvCubit cubit = BlocProvider.of<TvCubit>(context);
        if(state is GetPopularTvShowsLoadingState||cubit.popularTvShows==null){
          return const MediaHorizontalLoadingList(title: "Popular",);
        }
        if(state is GetPopularTvShowsErrorState||cubit.popularTvShowError!) {
          return MediaHorizontalError(title: "Popular",onPressed: () {
            cubit.getPopularTvShowsData();
          },);
        }
        if(state is GetPopularTvShowsSuccessState||cubit.popularTvShows!=null) {
          return HorizontalTvShowsList(
            tvShows: cubit.popularTvShows!,
            title: "Popular",
            onTap: () {
              cubit.seeMoreListTvShows.addAll(cubit.popularTvShows!);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  const MediaSeeMore(title:"Popular Tv Shows",popularTvShows: true, ),
              ));
            },
          );
        }

        return SliverToBoxAdapter(child: Container());
      },
    );
  }
}






