import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/features/movies/presentation/widgets/gallery/videos/movie_empty_video_list.dart';
import 'package:mo3tv/features/movies/presentation/widgets/gallery/videos/movie_videos_list.dart';
import 'package:mo3tv/features/movies/presentation/widgets/gallery/videos/movie_videos_loading_list.dart';



class MovieVideos extends StatelessWidget {

  const MovieVideos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        MovieCubit cubit = BlocProvider.of<MovieCubit>(context);
        if(cubit.movieVideos!=null){
          return MovieVideosList(movieVideos: cubit.movieVideos!);
        }
        if(state is GetMovieVideosLoadingState ||cubit.movieVideos==null)
          {
            return const MovieVideosLoadingList();
          }
        if( cubit.movieVideos!=null&&cubit.movieVideos!.isEmpty)
          {
            return const EmptyMoviesList();
          }
        return Container();
      },
    );
  }
}








