import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/features/movies/presentation/widgets/gallery/empty_image_list.dart';
import 'package:mo3tv/features/movies/presentation/widgets/gallery/logos/movie_logos_list.dart';
import 'package:mo3tv/features/movies/presentation/widgets/gallery/logos/movie_logos_loading_list.dart';

class MovieLogos extends StatelessWidget {
  const MovieLogos({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        MovieCubit cubit = BlocProvider.of<MovieCubit>(context);
        if(cubit.movieGallery!=null&&cubit.movieGallery!.logos!=null&&cubit.movieGallery!.logos!.isEmpty)
          {
            return const EmptyImageList(text:"No Logos",);
          }
        if(cubit.movieGallery!=null&&cubit.movieGallery!.logos!=null)
        {
          return MovieLogosList(logos: cubit.movieGallery!.logos!);
        }
        if(state is GetMovieGalleryLoadingState|| cubit.movieGallery ==null||cubit.movieGallery!.logos ==null)
          {
            return const MovieLogosLoadingList();
          }
        return Container();
      },
    );
  }
}















