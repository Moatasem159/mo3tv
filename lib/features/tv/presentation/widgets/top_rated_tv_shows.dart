import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_error.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_loading_list.dart';
import 'package:mo3tv/core/widgets/media_see_more/media_see_more.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/horizontal_tv_show_list.dart';


class TopRatedTvShows extends StatelessWidget {
  const TopRatedTvShows({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TvCubit, TvStates>(
      listener: (context, state) {},
      builder: (context, state) {
        TvCubit cubit = BlocProvider.of<TvCubit>(context);
        if(state is GetTopRatedMoviesLoadingState||cubit.topRatedTvShows==null) {
          return const MediaHorizontalLoadingList(title: "Top Rated",);
        }
        if(state is GetTopRatedMoviesErrorState||cubit.topRatedTvShowError!) {
          return MediaHorizontalError(title: "Top Rated",onPressed: () {
            cubit.getTopRatedTvShowsData();
          },);
        }
        if(state is GetTopRatedTvShowsSuccessState||cubit.topRatedTvShows!=null) {
            return HorizontalTvShowsList(
                tvShows:cubit.topRatedTvShows!,
              title: "Top Rated",
              onTap: () {
                cubit.seeMoreListTvShows.addAll(cubit.topRatedTvShows!);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  const MediaSeeMore(title:"Top rated Tv shows",topRatedTvShows: true, ),
                ));
              },
            );
          }

        return SliverToBoxAdapter(child: Container());

      },
    );
  }
}




