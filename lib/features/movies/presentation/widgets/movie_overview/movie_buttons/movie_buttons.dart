import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/core/widgets/buttons/buttons_loading_widget.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_buttons/movie_buttons_widget.dart';
class MovieButtons extends StatelessWidget {
  const MovieButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieStates>(
      builder: (context, state) {
        MovieCubit cubit = BlocProvider.of<MovieCubit>(context);
        if (state is GetMovieDetailsSuccessState || cubit.movie != Movie()) {
          return MovieButtonsWidget(movie: cubit.movie);
        }
        if (state is GetMovieDetailsLoadingState || cubit.movie == Movie()) {
          return  const ButtonsLoadingWidget();
        }
        return Container();
      },
    );
  }
}