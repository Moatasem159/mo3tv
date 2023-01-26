import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_error.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_loading_list.dart';
import 'package:mo3tv/core/widgets/media_see_more/media_see_more.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/top_rated_movies_cubit/top_rated_movies_state.dart';
import 'package:mo3tv/features/movies/presentation/widgets/horizontal_movie_list.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesStates>(
      builder: (context, state) {
        TopRatedMoviesCubit cubit = BlocProvider.of<TopRatedMoviesCubit>(context);
        if(state is GetTopRatedMoviesLoadingState){
          return const MediaHorizontalLoadingList();
        }
        if(state is GetTopRatedMoviesErrorState){
          return MediaHorizontalError(onPressed: () {
            cubit.getTopRatedMoviesData();
          },);
        }
        if(state is GetTopRatedMoviesSuccessState){
            return HorizontalMoviesList(
                movies: cubit.topRatedMovies,
              onPressed: () {
                BlocProvider.of<MoreMoviesCubit>(context).moreMovies.addAll(cubit.topRatedMovies,);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  const MediaSeeMore(title:"Top rated movies",index: 3, ),
                ));
              },
            );
          }
        return SliverToBoxAdapter(child: Container());
      },
    );
  }
}




