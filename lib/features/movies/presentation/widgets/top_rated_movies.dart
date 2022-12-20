import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_error.dart';
import 'package:mo3tv/core/widgets/media_horizontal_list/media_horizontal_loading_list.dart';
import 'package:mo3tv/core/widgets/media_see_more/media_see_more.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/features/movies/presentation/widgets/horizontal_movie_list.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        MovieCubit cubit = BlocProvider.of<MovieCubit>(context);
        if(state is GetTopRatedMoviesLoadingState ||cubit.topRatedMovies==null){
          return const MediaHorizontalLoadingList(title: "Top Rated",);
        }
        if(state is GetTopRatedMoviesErrorState||cubit.topRatedMoviesError!){
          return MediaHorizontalError(title: "Top Rated",onPressed: () {
            cubit.getTopRatedMoviesData();
          },);
        }
        if(state is GetTopRatedMoviesSuccessState||cubit.topRatedMovies!=null){
            return HorizontalMoviesList(
                movies: cubit.topRatedMovies!,
              title: "Top Rated",
              onTap: () {
                cubit.seeMoreListMovies.addAll(cubit.topRatedMovies!);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  const MediaSeeMore(title:"Top rated movies",topRatedMovies: true, ),
                ));
              },
            );
          }

        return SliverToBoxAdapter(child: Container());
      },
    );
  }
}




