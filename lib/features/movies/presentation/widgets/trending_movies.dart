import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_error.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_loading_list.dart';
import 'package:mo3tv/core/widgets/media_see_more/media_see_more.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/trending_movie_cubit/trending_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/trending_movie_cubit/trending_movie_state.dart';
import 'package:mo3tv/features/movies/presentation/widgets/horizontal_movie_list.dart';

class TrendingMovies extends StatelessWidget {

  const TrendingMovies({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingMovieCubit, TrendingMovieStates>(
      builder: (context, state) {
         if(state is GetTrendingMoviesLoadingState){
          return const MediaHorizontalLoadingList();
        }
        if(state is GetTrendingMoviesErrorState){
          return MediaHorizontalError(onPressed: () {
            BlocProvider.of<TrendingMovieCubit>(context).getTrendingMoviesData();
          },);
        }
        if(state is GetTrendingMoviesSuccessState) {
          return HorizontalMoviesList(
            movies: state.trendingMovies,
            onPressed: () {
              BlocProvider.of<MoreMoviesCubit>(context).moreMovies.addAll(state.trendingMovies);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  const MediaSeeMore(title:"Trending movies today",index:1,),
              ));
            },
          );
        }
        return SliverToBoxAdapter(child: Container());
      },
    );
  }
}






