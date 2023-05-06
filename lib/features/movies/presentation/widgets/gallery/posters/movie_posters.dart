import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/gallery/posters/media_posters_list.dart';
import 'package:mo3tv/core/widgets/gallery/posters/media_posters_loading_list.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/core/widgets/gallery/empty_image_list.dart';
class MoviePosters extends StatelessWidget {
  const MoviePosters({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieStates>(
      builder: (context, state) {
        MovieCubit cubit = BlocProvider.of<MovieCubit>(context);
        if(cubit.movieGallery!=null&&cubit.movieGallery!.posters!=null&&cubit.movieGallery!.posters!.isEmpty)
        {
          return const EmptyImageList(text:"No posters",);
        }
        if(cubit.movieGallery!=null&&cubit.movieGallery!.posters!=null)
        {
          return MediaPostersList(posters: cubit.movieGallery!.posters!);
        }
        if(state is GetMovieGalleryLoadingState||cubit.movieGallery ==null||cubit.movieGallery!.posters ==null)
        {
          return const MediaPosterLoadingList();
        }
        return Container();

      },
    );
  }
}