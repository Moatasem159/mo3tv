import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_tab_bar_cubit/tv_tab_bar_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/popular_tv_shows.dart';
import 'package:mo3tv/features/tv/presentation/widgets/top_rated_tv_shows.dart';
import 'package:mo3tv/features/tv/presentation/widgets/trending_tv_shows.dart';

class TvTabBarCubit extends Cubit<TvTabBarStates> {
  TvTabBarCubit() : super(TvTabBarInitialState());


  int index=0;
  List<Widget> lists=[
    const TrendingTvShows(),
    const PopularTvShows(),
    const TopRatedTvShows(),
  ];
  changeIndex(value,context){
    emit(ChangeTabBarLoadingState());
    index=value;
    if(index==1&&BlocProvider.of<TvCubit>(context).popularTvShows==null){
      BlocProvider.of<TvCubit>(context).getPopularTvShowsData();
    }
    if(index==2&&BlocProvider.of<TvCubit>(context).topRatedTvShows==null){
      BlocProvider.of<TvCubit>(context).getTopRatedTvShowsData();
    }
    emit(ChangeTabBarSuccessState());
  }



}

