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
        BlocProvider(create: (context) => LocaleCubit(di.sl(),di.sl())..getSavedLang()),
        BlocProvider(create: (context) => PlayingNowMovieCubit(di.sl())..getNowPlayingMoviesData()),
        BlocProvider(create: (context) => PlayingNowTvShowCubit(di.sl())..getNowPlayingTvShowsData()),
        BlocProvider(create: (context) => PopularMovieCubit(di.sl())..getPopularMoviesData()),
        BlocProvider(create: (context) => PopularTvShowCubit(di.sl())..getPopularTvShowsData()),
        BlocProvider(create: (context) => TrendingMovieCubit(di.sl())..getTrendingMoviesData()),
        BlocProvider(create: (context) => TrendingTvShowCubit(di.sl())..getTrendingTvShowsData()),
        BlocProvider(create: (context) => TopRatedMoviesCubit(di.sl())..getTopRatedMoviesData()),
        BlocProvider(create: (context) => TopRatedTvShowsCubit(di.sl())..getTopRatedTvShowsData()),
        BlocProvider(create: (context) => AccountListsCubit(di.sl())),
        BlocProvider(create: (context) => LoginCubit(di.sl(),di.sl())),
        BlocProvider(create: (context) => LogOutCubit(di.sl(),di.sl())),
        BlocProvider(create: (context) => AccountCubit(di.sl(),di.sl(),di.sl())),
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