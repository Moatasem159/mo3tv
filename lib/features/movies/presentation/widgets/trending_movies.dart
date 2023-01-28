import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/entities/see_more_parameters.dart';
import 'package:mo3tv/core/widgets/media_loading/media_error_list.dart';
import 'package:mo3tv/core/widgets/media_loading/media_loading_list.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/trending_movie_cubit/trending_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/trending_movie_cubit/trending_movie_state.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_list.dart';
class TrendingMovies extends StatelessWidget {
  const TrendingMovies({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const String title="Trending movies today";
    return BlocBuilder<TrendingMovieCubit,TrendingMovieStates>(
      builder:(context, state) {
        if(state is GetTrendingMoviesSuccessState){
          return MoviesList(movies:state.trendingMovies,
            title:title,
            onPressed: () {
              BlocProvider.of<MoreMoviesCubit>(context).moreMovies.addAll(state.trendingMovies);
              GoRouter.of(context).pushNamed(Routes.seeMoreRoute,
                  extra: SeeMoreParameters(title: title, isMovie: true, index: 1),);
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) =>  const MediaSeeMore(title:title,index:1,isMovie: true,),
              // ));
            },
          );
        }
        if(state is GetTrendingMoviesLoadingState){
          return const MediaLoadingList(title: title,);
        }
        if(state is GetTrendingMoviesErrorState){
          return MediaErrorList(
            title: title,
            onPressed:() {
              BlocProvider.of<TrendingMovieCubit>(context).getTrendingMoviesData();
            }, );
        }
        return  Container();
      },);
  }
}