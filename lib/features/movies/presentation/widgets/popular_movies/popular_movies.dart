import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/features/movies/presentation/widgets/popular_movies/popular_movies_list.dart';
import 'package:mo3tv/features/movies/presentation/widgets/popular_movies/popular_movies_loading_list.dart';

class PopularMovies extends StatelessWidget {

  const PopularMovies({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        MovieCubit cubit = BlocProvider.of<MovieCubit>(context);
        if(cubit.popularMovies!=null) {
          return PopularMoviesList(popularMovies: cubit.popularMovies!,);
        }
        if(cubit.popularMovies==null){
          return const PopularMoviesLoadingList();
        }
        return SliverToBoxAdapter(child: Container());
      },
    );
  }
}






