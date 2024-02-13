import 'package:flutter/material.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/media/presentation/widgets/playing_now_media_widgets/playing_now_media.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_horizontal_list_widgets/media_list.dart';
class MediaScreen extends StatelessWidget {
  final String mediaType;
  const MediaScreen({super.key, required this.mediaType});
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        PlayingNowMedia(
          params: MediaParams(
            mediaType: mediaType,
            listType: mediaType == AppStrings.movie
                ? AppStrings.nowPlaying
                : AppStrings.onAir,
          ),
        ),
        MediaList(
          params: MediaParams(
            mediaType: mediaType,
            listType: AppStrings.discover,
            listTitle: mediaType == AppStrings.movie
                ? AppStrings.moviesForYou
                : AppStrings.tvShowsForYou,
          ),
        ),
        MediaList(
          params: MediaParams(
            mediaType: mediaType,
            listType: AppStrings.trending,
            listTitle: mediaType == AppStrings.movie
                ? AppStrings.trendingMoviesToday
                : AppStrings.trendingTvShows,
          ),
        ),
        MediaList(
          params: MediaParams(
            mediaType: mediaType,
            listType: AppStrings.popular,
            listTitle: mediaType == AppStrings.movie
                ? AppStrings.popularMovies
                : AppStrings.popularTvShows,
          ),
        ),
        MediaList(
          params: MediaParams(
            mediaType: mediaType,
            listType: AppStrings.topRated,
            listTitle: mediaType == AppStrings.movie
                ? AppStrings.topRatedMovies
                : AppStrings.topRaredTvShows,
          ),
        ),
      ],
    );
  }
}