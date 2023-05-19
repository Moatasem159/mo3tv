import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/keywords_widgets/genres_widget.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
class MovieGenresWidget extends StatelessWidget {
  const MovieGenresWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieStates>(
      builder: (context, state) {
        if (state is GetMovieDetailsSuccessState) {
          return Column(
            children: [
              5.ph,
              if (state.movie.genres!.isNotEmpty)
                GenresWidget(
                    genres: state.movie.genres!,
                    runTime: state.movie.runtime,
                    isTvShow: false),
            ],
          );
        }
        return Container();
      },
    );
  }
}