import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_error.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_loading_list.dart';
import 'package:mo3tv/core/widgets/media_see_more/media_see_more.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/features/movies/presentation/widgets/horizontal_movie_list.dart';

class PopularMovies extends StatelessWidget {

  const PopularMovies({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        MovieCubit cubit = BlocProvider.of<MovieCubit>(context);
        if(state is GetPopularMoviesLoadingState||cubit.popularMovies==null){
          return const MediaHorizontalLoadingList(title: "Popular");
        }
        if(state is GetPopularMoviesErrorState||cubit.popularMoviesError!) {
          return MediaHorizontalError(title:"Popular",onPressed: () {
            cubit.getPopularMoviesData();
          },);
        }
        if(state is GetPopularMoviesSuccessState||cubit.popularMovies!=null) {
          return HorizontalMoviesList(
            movies: cubit.popularMovies!,
            title: "Popular",
            onTap: () {
              cubit.seeMoreListMovies.addAll(cubit.popularMovies!);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  const MediaSeeMore(title:"Popular movies",popularMovies: true, ),
              ));
            },
          );
        }
        return SliverToBoxAdapter(child: Container());
      },
    );
  }
}






