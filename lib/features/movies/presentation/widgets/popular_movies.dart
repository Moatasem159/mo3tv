import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_error.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_loading_list.dart';
import 'package:mo3tv/core/widgets/media_see_more/media_see_more.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/popular_movie_cubit/popular_movie_state.dart';
import 'package:mo3tv/features/movies/presentation/widgets/horizontal_movie_list.dart';

class PopularMovies extends StatelessWidget {

  const PopularMovies({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMovieCubit, PopularMovieStates>(
      builder: (context, state) {
        PopularMovieCubit cubit = BlocProvider.of<PopularMovieCubit>(context);
        if(state is GetPopularMoviesLoadingState){
          return const MediaHorizontalLoadingList();
        }
        if(state is GetPopularMoviesErrorState) {
          return MediaHorizontalError(onPressed: () {
            BlocProvider.of<PopularMovieCubit>(context).getPopularMoviesData();
          },);
        }
        if(state is GetPopularMoviesSuccessState) {
          return HorizontalMoviesList(
            movies: cubit.popularMovies,
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
        return SliverToBoxAdapter(child: Container());
      },
    );
  }
}






