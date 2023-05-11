import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/genres_widget.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';

class MovieGenresWidget extends StatelessWidget {
  const MovieGenresWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieStates>(
      builder: (context, state) {
        MovieCubit cubit = BlocProvider.of<MovieCubit>(context);
        if (state is GetMovieDetailsSuccessState || cubit.movie != Movie()) {
          return Column(
            children: [
              5.ph,
              if (cubit.movie.genres!.isNotEmpty)
                GenresWidget(
                    genres: cubit.movie.genres!,
                    runTime: cubit.movie.runtime,
                    isTvShow: false),
            ],
          );
        }
        return Container();
      },
    );
  }
}