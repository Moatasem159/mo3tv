import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/app/injection_container.dart'as di;
import 'package:mo3tv/core/widgets/playing_now_media/playing_now_media_error_card.dart';
import 'package:mo3tv/core/widgets/playing_now_media/playing_now_media_loading_carousal.dart';
import 'package:mo3tv/features/movies/presentation/cubit/playing_now_movie_cubit/playing_now_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/playing_now_movie_cubit/playing_now_movie_state.dart';
import 'package:mo3tv/features/movies/presentation/widgets/playing_now_movies/playing_now_carousal_movie.dart';

class PlayingNowMovies extends StatelessWidget {
  const PlayingNowMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<PlayingNowMovieCubit>()..getNowPlayingMoviesData(),
      child: BlocBuilder<PlayingNowMovieCubit, PlayingNowMovieStates>(
        builder: (context, state) {
          if (state is GetNowPlayingMoviesLoadingState) {
            return const PlayingNowMediaLoadingCarousal();
          }
          if (state is GetNowPlayingMoviesSuccessState) {
            return PlayingNowMoviesCarousal(movies: state.nowPlayingMovies);
          }
          if (state is GetNowPlayingMoviesErrorState) {
            return PlayingNowMediaErrorCard(onPressed: () =>
                PlayingNowMovieCubit.get(context).getNowPlayingMoviesData());
          }
          return Container();
        },
      ),
    );
  }
}