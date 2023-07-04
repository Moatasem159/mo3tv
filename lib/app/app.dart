import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/config/lang/app_localizations_setup.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/config/themes/app_theme.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit/account_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_cubit.dart';
import 'package:mo3tv/features/login/presentation/cubit/login_cubit.dart';
import 'package:mo3tv/features/logout/presentation/cubit/log_out_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/playing_now_movie_cubit/playing_now_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/trending_movie_cubit/trending_movie_cubit.dart';
import 'package:mo3tv/features/settings/presentation/cubits/locale_cubit/locale_cubit.dart';
import 'package:mo3tv/features/settings/presentation/cubits/locale_cubit/locale_states.dart';
import 'package:mo3tv/features/tv/presentation/cubit/playing_now_tv_show_cubit/playing_now_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/popular_tv_show_cubit/popular_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/top_rated_tv_show_cubit/top_rated_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/trending_tv_show_cubit/trending_tv_show_cubit.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
class Mo3Tv extends StatelessWidget {
  const Mo3Tv({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<LocaleCubit>()..getSavedLang()),
        BlocProvider(create: (context) => di.sl<PlayingNowMovieCubit>()..getNowPlayingMoviesData()),
        BlocProvider(create: (context) => di.sl<PlayingNowTvShowCubit>()..getNowPlayingTvShowsData()),
        BlocProvider(create: (context) => di.sl<PopularMovieCubit>()..getPopularMoviesData()),
        BlocProvider(create: (context) => di.sl<PopularTvShowCubit>()..getPopularTvShowsData()),
        BlocProvider(create: (context) => di.sl<TrendingMovieCubit>()..getTrendingMoviesData()),
        BlocProvider(create: (context) => di.sl<TrendingTvShowCubit>()..getTrendingTvShowsData()),
        BlocProvider(create: (context) => di.sl<TopRatedMoviesCubit>()..getTopRatedMoviesData()),
        BlocProvider(create: (context) => di.sl<TopRatedTvShowsCubit>()..getTopRatedTvShowsData()),
        BlocProvider(create: (context) => di.sl<AccountListsCubit>()),
        BlocProvider(create: (context) => di.sl<LoginCubit>()),
        BlocProvider(create: (context) => di.sl<LogOutCubit>()),
        BlocProvider( create: (context) => di.sl<AccountCubit>()),
      ],
      child: BlocBuilder<LocaleCubit, LocaleStates>(
        buildWhen: (previous, current) {
          return previous != current;
        },
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRoute.router,
            themeMode: ThemeMode.dark,
            darkTheme: AppTheme.darkTheme,
            locale: state.locale,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
            localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback);
        },
      ),
    );
  }
}