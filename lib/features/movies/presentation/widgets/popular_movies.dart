import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/entities/see_more_parameters.dart';
import 'package:mo3tv/core/widgets/media_loading/media_error_list.dart';
import 'package:mo3tv/core/widgets/media_loading/media_loading_list.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/popular_movie_cubit/popular_movie_state.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_list.dart';
class PopularMovies extends StatelessWidget {
  const PopularMovies({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const String title="Popular movies";
    return BlocBuilder<PopularMovieCubit,PopularMovieStates>(
      builder:(context, state) {
        if(state is GetPopularMoviesSuccessState){
          return MoviesList(
            movies: state.popularMovies,
            title:title,
            onPressed: () {
              BlocProvider.of<MoreMoviesCubit>(context)
                  .moreMovies
                  .addAll(state.popularMovies);
              GoRouter.of(context).pushNamed(Routes.seeMoreRoute,
                extra: SeeMoreParameters(title: title, isMovie: true, index: 2),);
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const MediaSeeMore(
              //     title: title,
              //     index: 2,
              //     isMovie: true,
              //   ),
              // ));
            },
          );
        }
        if(state is GetPopularMoviesLoadingState){
          return const MediaLoadingList(title: title,);
        }
        if(state is GetPopularMoviesErrorState){
          return MediaErrorList(
            title: title,
            onPressed:() {
              BlocProvider.of<PopularMovieCubit>(context).getPopularMoviesData();
            }, );
        }
        return  Container();
      },);
  }
}