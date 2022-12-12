import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/config/themes/app_theme.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_state.dart';
import 'package:mo3tv/features/login/presentation/cubit/login_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/injection_container.dart' as di;

class Mo3Tv extends StatelessWidget {
  const Mo3Tv({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
            di.sl<MovieCubit>()
            ..getNowPlayingMoviesData()
            ..getPopularMoviesData()
            ..getTopRatedMoviesData(),
          ),
          BlocProvider(create: (context) =>
          di.sl<AccountCubit>()
            ..getLists(),
          ),
          BlocProvider(
              create: (context) => di.sl<LoginCubit>())
        ],
        child: BlocConsumer<AccountCubit, AccountStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRoute.onGenerateRoute,
              themeMode: ThemeMode.dark,
              darkTheme: AppTheme.darkTheme,
            );
          },
        ));
  }
}
