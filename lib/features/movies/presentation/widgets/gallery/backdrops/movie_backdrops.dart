import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/core/widgets/gallery/backdrops/backdrop_list.dart';
import 'package:mo3tv/core/widgets/gallery/backdrops/backdrops_loading_list.dart';
import 'package:mo3tv/core/widgets/gallery/empty_image_list.dart';

class MovieBackdrops extends StatelessWidget {
  const MovieBackdrops({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieStates>(
      builder: (context, state) {
        MovieCubit cubit = BlocProvider.of<MovieCubit>(context);
        if(cubit.movieGallery!=null&&cubit.movieGallery!.backdrops!=null&&cubit.movieGallery!.backdrops!.isEmpty)
        {
          // No Backdrops
          return const EmptyImageList(text:"No Backdrops",);
        }
        if(cubit.movieGallery!=null&&cubit.movieGallery!.backdrops!=null)
        {
          return BackdropsList(backdrops:cubit.movieGallery!.backdrops!);
        }
        if(state is GetMovieGalleryLoadingState|| cubit.movieGallery ==null||cubit.movieGallery!.backdrops ==null)
        {
          return const BackdropsLoadingList();
        }

        return Container();
      },
    );
  }
}