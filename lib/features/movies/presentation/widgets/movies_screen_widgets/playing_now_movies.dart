import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/media_playing_now/media_playing_now_carousal.dart';
import 'package:mo3tv/core/widgets/media_playing_now/playing_now_media_error_card.dart';
import 'package:mo3tv/core/widgets/media_playing_now/playing_now_media_loading_carousal.dart';
import 'package:mo3tv/features/movies/presentation/cubit/get_movies_list_cubit/get_movies_list_cubit.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
import 'package:mo3tv/features/movies/presentation/cubit/get_movies_list_cubit/get_movies_list_states.dart';
class PlayingNowMovies extends StatelessWidget {
  const PlayingNowMovies({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetMoviesListCubit(di.sl(),AppStrings.nowPlaying)..getMoviesList(),
      child: BlocBuilder<GetMoviesListCubit, GetMoviesListStates>(
        builder: (context, state) {
          if (state is GetMoviesListLoadingState) {
            return const PlayingNowMediaLoadingCarousal();
          }
          if (state is GetMoviesListSuccessState) {
            return MediaPlayingNowCarousal(media: state.movies, isMovie: true);
          }
          if (state is GetMoviesListErrorState) {
            return PlayingNowMediaErrorCard(onPressed: () => GetMoviesListCubit.get(context).getMoviesList());
          }
          return const SizedBox();
        },
      ),
    ).addPadding(t: 20, b: 10);
  }
}