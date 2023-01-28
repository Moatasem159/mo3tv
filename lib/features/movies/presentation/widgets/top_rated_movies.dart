import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/media_see_more/media_see_more.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/top_rated_movies_cubit/top_rated_movies_state.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_error_list.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_list.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_loading_list.dart';
class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const String title="Top rated movies";
    return BlocBuilder<TopRatedMoviesCubit,TopRatedMoviesStates>(
      builder:(context, state) {
        TopRatedMoviesCubit cubit = BlocProvider.of<TopRatedMoviesCubit>(context);
        if(state is GetTopRatedMoviesSuccessState)
        {
          return MoviesList(
            movies: cubit.topRatedMovies,
            title:title,
            onPressed: () {
              BlocProvider.of<MoreMoviesCubit>(context).moreMovies.addAll(cubit.topRatedMovies,);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  const MediaSeeMore(title:"Top rated movies",index: 3, ),
              ));
            },
          );
        }
        if(state is GetTopRatedMoviesLoadingState)
        {
          return const MoviesLoadingList(title: title,);
        }
        if(state is GetTopRatedMoviesErrorState){
          return MovieErrorList(
            title: title,
            onPressed:() {
              BlocProvider.of<TopRatedMoviesCubit>(context).getTopRatedMoviesData();
            }, );
        }
        return  const MoviesLoadingList(title: title,);
      },);
  }
}
