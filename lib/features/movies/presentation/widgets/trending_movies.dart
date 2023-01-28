import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/media_see_more/media_see_more.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/trending_movie_cubit/trending_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/trending_movie_cubit/trending_movie_state.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_error_list.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_list.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_loading_list.dart';
class TrendingMovies extends StatelessWidget {
  const TrendingMovies({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const String title="Trending movies today";
    return BlocBuilder<TrendingMovieCubit,TrendingMovieStates>(
      builder:(context, state) {
        if(state is GetTrendingMoviesSuccessState)
        {
          return MoviesList(movies:state.trendingMovies,
            title:title,
            onPressed: () {
              BlocProvider.of<MoreMoviesCubit>(context).moreMovies.addAll(state.trendingMovies);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  const MediaSeeMore(title:"Trending movies today",index:1,),
              ));
            },
          );
        }
        if(state is GetTrendingMoviesLoadingState)
        {
          return const MoviesLoadingList(title: title,);
        }
        if(state is GetTrendingMoviesErrorState){
          return MovieErrorList(
            title: title,
            onPressed:() {
              BlocProvider.of<TrendingMovieCubit>(context).getTrendingMoviesData();
            }, );

        }
        return  Container();
      },);
  }
}