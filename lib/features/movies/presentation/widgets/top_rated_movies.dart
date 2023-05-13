import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/entities/see_more_parameters.dart';
import 'package:mo3tv/core/widgets/media_loading/media_error_list.dart';
import 'package:mo3tv/core/widgets/media_loading/media_loading_list.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/top_rated_movies_cubit/top_rated_movies_state.dart';
import 'package:mo3tv/features/movies/presentation/widgets/horizontal_movie_list.dart';
class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const String title="Top rated movies";
    return BlocBuilder<TopRatedMoviesCubit,TopRatedMoviesStates>(
      builder:(context, state) {
        if(state is GetTopRatedMoviesSuccessState){
          return HorizontalMoviesList(
            movies: state.topRatedMovies,
            title:title,
            onPressed: () {
              BlocProvider.of<MoreMoviesCubit>(context).moreMovies.addAll(state.topRatedMovies,);
              GoRouter.of(context).pushNamed(Routes.seeMoreRoute,
                extra: SeeMoreParameters(title: title, isMovie: true, index: 3));
            },
          );
        }
        if(state is GetTopRatedMoviesLoadingState){
          return const MediaLoadingList(title: title,);
        }
        if(state is GetTopRatedMoviesErrorState){
          return MediaErrorList(
            title: title,
            onPressed:() {
              BlocProvider.of<TopRatedMoviesCubit>(context).getTopRatedMoviesData();
            }, );
        }
        return Container();
      },);
  }
}