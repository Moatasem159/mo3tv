import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/entities/see_more_parameters.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_list.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_error_list.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_loading_list.dart';
import 'package:mo3tv/features/movies/presentation/cubit/trending_movie_cubit/trending_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/trending_movie_cubit/trending_movie_state.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});
  @override
  Widget build(BuildContext context) {
    const String title = AppStrings.trendingMoviesToday;
    return BlocProvider(
      create: (context) => TrendingMovieCubit(di.sl())..getTrendingMoviesData(),
      child: BlocBuilder<TrendingMovieCubit, TrendingMovieStates>(
          builder: (context, state) {
            if (state is GetTrendingMoviesSuccessState) {
              return MediaHorizontalList(
                media: state.movies,
                isMovie: true,
                title: title,
                onPressed: () {
                  GoRouter.of(context).pushNamed(Routes.seeMoreMoviesRoute,
                      extra: SeeMoreParameters(
                          title: title,
                          isMovie: true,
                          index: 1,
                          media: state.movies));
                },
              );
            }
            if (state is GetTrendingMoviesLoadingState) {
              return const MediaLoadingList(title: title);
            }
            if (state is GetTrendingMoviesErrorState) {
              return MediaErrorList(
                  title: title,
                  onPressed: () =>
                      TrendingMovieCubit.get(context).getTrendingMoviesData());
            }
            return Container();
          }),
    );
  }
}