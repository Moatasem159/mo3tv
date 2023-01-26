import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_tab_bar_cubit/movie_tab_bar_state.dart';
import 'package:mo3tv/features/movies/presentation/cubit/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/widgets/popular_movies.dart';
import 'package:mo3tv/features/movies/presentation/widgets/top_rated_movies.dart';
import 'package:mo3tv/features/movies/presentation/widgets/trending_movies.dart';

class MovieTabBarCubit extends Cubit<MovieTabBarStates> {
  MovieTabBarCubit() : super(MovieTabBarInitialState());


  int index=0;
  List<Widget> lists=[
    const TrendingMovies(),
    const PopularMovies(),
    const TopRatedMovies(),
  ];
  changeIndex(value,context){
    emit(ChangeTabBarLoadingState());
    index=value;
    if(index==1&&BlocProvider.of<PopularMovieCubit>(context).popularMovies.isEmpty){
      BlocProvider.of<PopularMovieCubit>(context).getPopularMoviesData();
    }
    if(index==2&&BlocProvider.of<TopRatedMoviesCubit>(context).topRatedMovies.isEmpty){
      BlocProvider.of<TopRatedMoviesCubit>(context).getTopRatedMoviesData();
    }
    emit(ChangeTabBarSuccessState());
  }
}

