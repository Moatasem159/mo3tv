import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_info_widgets/movie_info_loading_widget.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_info_widgets/movie_info_widget.dart';
class MovieInfo extends StatelessWidget {
  const MovieInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieStates>(
      builder: (context, state) {
        MovieCubit cubit = BlocProvider.of<MovieCubit>(context);
        if (state is GetMovieDetailsLoadingState || cubit.movie == Movie()){
          return const MovieInfoLoadingWidget();
        }
        if (state is GetMovieDetailsSuccessState || cubit.movie != Movie()) {
          return MovieInfoWidget(movie: cubit.movie);
        }
        return Container();
      },
    );
  }
}