import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/entities/see_more_parameters.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_list.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_error_list.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_loading_list.dart';
import 'package:mo3tv/features/movies/presentation/cubit/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/popular_movie_cubit/popular_movie_state.dart';
class PopularMovies extends StatelessWidget {
  const PopularMovies({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const String title=AppStrings.popularMovies;
    return BlocBuilder<PopularMovieCubit,PopularMovieStates>(
        builder:(context, state) {
          if(state is GetPopularMoviesSuccessState){
            return MediaHorizontalList(
              media: state.popularMovies,
              isMovie: true,
              title:title,
              onPressed: () {
                GoRouter.of(context).pushNamed(Routes.seeMoreRoute,
                  extra: SeeMoreParameters(title: title, isMovie: true, index: 2,media: state.popularMovies));
              },
            );
          }
          if(state is GetPopularMoviesLoadingState){
            return const MediaLoadingList(title: title);
          }
          if(state is GetPopularMoviesErrorState){
            return MediaErrorList(
              title: title,
              onPressed:() => PopularMovieCubit.get(context).getPopularMoviesData());
          }
          return  Container();
        });
  }
}