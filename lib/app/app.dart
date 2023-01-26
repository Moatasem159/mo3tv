import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/config/themes/app_theme.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit.dart';
import 'package:mo3tv/features/login/presentation/cubit/login_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/playing_now_movie_cubit/playing_now_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/trending_movie_cubit/trending_movie_cubit.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/app/injection_container.dart' as di;

class Mo3Tv extends StatelessWidget {
  const Mo3Tv({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di.sl<MovieCubit>()),
          BlocProvider(create: (context) => di.sl<TvCubit>()
            ..getNowPlayingTvShowsData()
            ..getTrendingTvShowsData()),
          BlocProvider(create: (context) => di.sl<PlayingNowMovieCubit>()..getNowPlayingMoviesData()),
          BlocProvider(create: (context) => di.sl<PopularMovieCubit>()),
          BlocProvider(create: (context) => di.sl<TrendingMovieCubit>()..getTrendingMoviesData()),
          BlocProvider(create: (context) => di.sl<TopRatedMoviesCubit>()),
          BlocProvider(create: (context) => di.sl<MoreMoviesCubit>()),
          BlocProvider(create: (context) => di.sl<AccountCubit>()..getAccountDetails()..getLists()),
          BlocProvider(create: (context) => di.sl<LoginCubit>()),
          BlocProvider(create: (context) => di.sl<SearchCubit>())
        ],
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoute.onGenerateRoute,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,
    ));
  }
}
