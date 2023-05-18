import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/keywords_widgets/genres_widget.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
class MovieGenresWidget extends StatefulWidget {
  const MovieGenresWidget({super.key});
  @override
  State<MovieGenresWidget> createState() => _MovieGenresWidgetState();
}
class _MovieGenresWidgetState extends State<MovieGenresWidget> with SingleTickerProviderStateMixin{
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_fadeController);
    _fadeController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieStates>(
      builder: (context, state) {
        if (state is GetMovieDetailsSuccessState) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              children: [
                5.ph,
                if (state.movie.genres!.isNotEmpty)
                  GenresWidget(
                      genres: state.movie.genres!,
                      runTime: state.movie.runtime,
                      isTvShow: false),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}