import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/media_horizontal_loading_list.dart';
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
        if(cubit.popularTvShows.isNotEmpty) {
          return HorizontalTvShowsList(
            tvShows: cubit.popularTvShows,
            title: "Popular",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  const MediaSeeMore(title:"Popular Tv Shows",popularTvShows: true, ),
              ));
            },
          );
        }
        if(cubit.popularTvShows.isEmpty){
          return const MediaHorizontalLoadingList(title: "Popular",);
        }
        return SliverToBoxAdapter(child: Container());
      },
    );
  }
}






