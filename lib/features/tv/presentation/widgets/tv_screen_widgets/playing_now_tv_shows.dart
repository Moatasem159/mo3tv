import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/widgets/media_playing_now/media_playing_now_carousal.dart';
import 'package:mo3tv/core/widgets/media_playing_now/playing_now_media_error_card.dart';
import 'package:mo3tv/core/widgets/media_playing_now/playing_now_media_loading_carousal.dart';
import 'package:mo3tv/features/tv/presentation/cubit/get_tv_shows_list_cubit/get_tv_shows_list_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/get_tv_shows_list_cubit/get_tv_shows_list_state.dart';
class PlayingNowTvShows extends StatelessWidget {
  const PlayingNowTvShows({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetTvShowsListCubit(di.sl(),AppStrings.onAir)..getNowPlayingTvShowsData(),
      child: BlocBuilder<GetTvShowsListCubit, GetTvShowsListStates>(
        builder: (context, state) {
          if (state is GetTvShowsListLoadingState) {
            return const PlayingNowMediaLoadingCarousal();
          }
          if (state is GetTvShowsListSuccessState) {
            return MediaPlayingNowCarousal(media: state.tvShows, isMovie: false);
          }
          if (state is GetTvShowsListErrorState) {
            return PlayingNowMediaErrorCard(onPressed: () =>  GetTvShowsListCubit.get(context).getNowPlayingTvShowsData());
          }
          return const SizedBox();
        },
      ),
    ).addPadding(t: 20, b: 10);
  }
}