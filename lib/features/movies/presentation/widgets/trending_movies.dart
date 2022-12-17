import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/media_horizontal_loading_list.dart';
import 'package:mo3tv/core/widgets/media_see_more/media_see_more.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/features/movies/presentation/widgets/horizontal_movie_list.dart';

class TrendingMovies extends StatelessWidget {

  const TrendingMovies({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        MovieCubit cubit = BlocProvider.of<MovieCubit>(context);
        if(cubit.trendingMovies.isNotEmpty) {
          return HorizontalMoviesList(
            movies: cubit.trendingMovies,
            title: "Trending movies today",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  const MediaSeeMore(title:"Trending movies today",trendingMovies: true, ),
              ));
            },
          );
        }
        if(cubit.trendingMovies.isEmpty){
          return const MediaHorizontalLoadingList(title: "Trending movies today");
        }
        return SliverToBoxAdapter(child: Container());
      },
    );
  }
}






