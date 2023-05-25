import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_cubit/movie_buttons_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/core/widgets/buttons/buttons_loading_widget.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_buttons/movie_buttons_widget.dart';
class MovieButtons extends StatelessWidget {
  final String listType;
  const MovieButtons({Key? key,this.listType=''}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieStates>(
      builder: (context, state) {
        if (state is GetMovieDetailsSuccessState) {
          MovieButtonsCubit.get(context).movie=state.movie;
          return MovieButtonsWidget(movie: state.movie,listType: listType);
        }
        if (state is GetMovieDetailsLoadingState) {
          return  const ButtonsLoadingWidget();
        }
        return Container();
      },
    );
  }
}