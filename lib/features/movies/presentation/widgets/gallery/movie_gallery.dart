import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';


class MovieGallery extends StatelessWidget {
  const MovieGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieStates>(
      builder: (context, state) {
        return SliverToBoxAdapter(
            child: BlocProvider
                .of<MovieCubit>(context)
                .movieGalleryList[BlocProvider
                .of<MovieCubit>(context)
                .index]);
      },
    );
  }
}
