import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/media_see_more/media_see_more.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/popular_movie_cubit/popular_movie_state.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_error_list.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_list.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_loading_list.dart';
class PopularMovies extends StatelessWidget {
  const PopularMovies({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const String title="Popular movies";
    return BlocBuilder<PopularMovieCubit,PopularMovieStates>(
      builder:(context, state) {
        PopularMovieCubit cubit = BlocProvider.of<PopularMovieCubit>(context);
        if(state is GetPopularMoviesSuccessState)
        {
          return MoviesList(
            movies: cubit.popularMovies,
            title:title,
            onPressed: () {
              BlocProvider.of<MoreMoviesCubit>(context)
                  .moreMovies
                  .addAll(cubit.popularMovies);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MediaSeeMore(
                  title: "Popular movies",
                  index: 2,
                ),
              ));
            },
          );
        }
        if(state is GetPopularMoviesLoadingState)
        {
          return const MoviesLoadingList(title: title,);
        }
        if(state is GetPopularMoviesErrorState){
          return MovieErrorList(
            title: title,
            onPressed:() {
              BlocProvider.of<PopularMovieCubit>(context).getPopularMoviesData();
            }, );
        }
        return  Container();
      },);
  }
}



