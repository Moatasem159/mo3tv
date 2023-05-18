import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_bottomnav_cubit/movie_bottom_nav_state.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_states.dart';
import 'package:mo3tv/features/movies/presentation/widgets/play_button/play_button_widget.dart';
class PlayButton extends StatelessWidget {
  final double shrinkOffset;
  const PlayButton({super.key, required this.shrinkOffset});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBottomNavCubit,MovieBottomNavStates>(
      builder: (context, state) {
        if (MovieBottomNavCubit.get(context).index == 0) {
          return BlocBuilder<MovieCubit, MovieStates>(
            builder: (context, state) {
              if(state is GetMovieDetailsSuccessState)
                {
                  if(state.movie.trailer!=null) {
                    return PlayButtonWidget(
                      url: state.movie.trailer!.key!,
                      name: state.movie.trailer!.name!,
                        shrinkOffset: shrinkOffset,
                    );
                  }
                }
              return Container();
            },
          );
        }
        return Container();
      },
    );
  }
}