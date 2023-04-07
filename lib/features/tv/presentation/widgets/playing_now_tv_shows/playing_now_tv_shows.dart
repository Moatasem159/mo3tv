import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/playing_now_media/playing_now_media_error_card.dart';
import 'package:mo3tv/core/widgets/playing_now_media/playing_now_media_loading_carousal.dart';
import 'package:mo3tv/features/tv/presentation/cubit/playing_now_tv_show_cubit/playing_now_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/playing_now_tv_show_cubit/playing_now_tv_show_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/playing_now_tv_shows/playing_now_tv_show_carousal.dart';
class PlayingNowTvShowsWidget extends StatelessWidget {
  const PlayingNowTvShowsWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayingNowTvShowCubit, PlayingNowTvShowStates>(
      builder: (context, state) {
        if(state is GetNowPlayingTvShowsSuccessState)
        {
          return PlayingNowTvShowCarousal(tvShows:  state.playingNowTvShows,);
        }
        if(state is GetNowPlayingTvShowsLoadingState)
        {
          return const PlayingNowMediaLoadingCarousal();
        }
        if(state is GetNowPlayingTvShowsErrorState)
        {
          return PlayingNowMediaErrorCard(onPressed:() {
           PlayingNowTvShowCubit.get(context).getNowPlayingTvShowsData();
          },);
        }
        return Container();
      },
    );
  }
}

