import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_description_widget/movie_description_loading_widget.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_description_widget/movie_description_widget.dart';
class MovieDescription extends StatelessWidget {
  const MovieDescription({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieStates>(
      builder: (context, state) {
        if (state is GetMovieDetailsLoadingState) {
          return const MovieDescriptionLoadingWidget();
        }
        if (state is GetMovieDetailsSuccessState) {
          return MovieDescriptionWidget(movie:state.movie);
        }
        return Container();
      },
    );
  }
}