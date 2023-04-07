import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/entities/see_more_parameters.dart';
import 'package:mo3tv/core/widgets/media_loading/media_error_list.dart';
import 'package:mo3tv/core/widgets/media_loading/media_loading_list.dart';
import 'package:mo3tv/features/tv/presentation/cubit/more_tv_shows_cubit/more_tv_shows_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/trending_tv_show_cubit/trending_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/trending_tv_show_cubit/trending_tv_show_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_list.dart';
class TrendingTvShow extends StatelessWidget {
  const TrendingTvShow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const String title="Trending tv show today";
    return BlocBuilder<TrendingTvShowCubit,TrendingTvShowStates>(
      builder:(context, state) {
        if(state is GetTrendingTvShowsSuccessState)
        {
          return TvShowList(tvShow:state.trendingTvSHows,
            title:title,
            onPressed: () {
              MoreTvShowsCubit.get(context).moreTvShows.addAll(state.trendingTvSHows);
              GoRouter.of(context).pushNamed(Routes.seeMoreRoute,
                extra: SeeMoreParameters(title: title, isMovie: false, index: 1),);
            },
          );
        }
        if(state is GetTrendingTvShowsLoadingState)
        {
          return const MediaLoadingList(title: title,);
        }
        if(state is GetTrendingTvShowsErrorState){
          return MediaErrorList(
            title: title,
            onPressed:() {
              TrendingTvShowCubit.get(context).getTrendingTvShowsData();
            }, );
        }
        return  Container();
      },);
  }
}