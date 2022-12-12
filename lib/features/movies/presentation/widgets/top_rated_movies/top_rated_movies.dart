import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/features/movies/presentation/widgets/top_rated_movies/top_rated_movies_list.dart';
import 'package:mo3tv/features/movies/presentation/widgets/top_rated_movies/top_rated_movies_loading_list.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        MovieCubit cubit = BlocProvider.of<MovieCubit>(context);
        if(cubit.topRatedMovies!=null)
          {
            return TopRatedMoviesList(topRatedMovies: cubit.topRatedMovies!);
          }
        if(cubit.topRatedMovies==null)
          {
            return const TopRatedMoviesLoadingList();
          }
        return SliverToBoxAdapter(child: Container());

      },
    );
  }
}




