import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/widgets/media_playing_now/media_playing_now_carousal.dart';
import 'package:mo3tv/core/widgets/media_playing_now/playing_now_media_error_card.dart';
import 'package:mo3tv/core/widgets/media_playing_now/playing_now_media_loading_carousal.dart';
import 'package:mo3tv/features/tv/presentation/cubit/playing_now_tv_show_cubit/playing_now_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/playing_now_tv_show_cubit/playing_now_tv_show_state.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
class PlayingNowTvShows extends StatelessWidget {
  const PlayingNowTvShows({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayingNowTvShowCubit(di.sl())..getNowPlayingTvShowsData(),
      child: BlocBuilder<PlayingNowTvShowCubit, PlayingNowTvShowStates>(
        builder: (context, state) {
          if (state is GetNowPlayingTvShowsSuccessState) {
            return MediaPlayingNowCarousal(media: state.tvShows, isMovie: false);
          }
          if (state is GetNowPlayingTvShowsLoadingState) {
            return const PlayingNowMediaLoadingCarousal();
          }
          if (state is GetNowPlayingTvShowsErrorState) {
            return PlayingNowMediaErrorCard(onPressed: () =>  PlayingNowTvShowCubit.get(context).getNowPlayingTvShowsData());
          }
          return Container();
        },
      ),
    ).addPadding(t: 20, b: 10);
  }
}