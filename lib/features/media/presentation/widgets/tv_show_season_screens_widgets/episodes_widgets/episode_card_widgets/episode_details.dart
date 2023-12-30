import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/media/domain/entities/episode.dart';
import 'package:mo3tv/features/media/presentation/widgets/tv_show_season_screens_widgets/episodes_widgets/episode_card_widgets/episode_image.dart';
import 'package:mo3tv/features/media/presentation/widgets/tv_show_season_screens_widgets/episodes_widgets/episode_card_widgets/episode_info.dart';
class EpisodeDetails extends StatelessWidget {
  final Episode episode;
  const EpisodeDetails({super.key, required this.episode});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EpisodeImage(image: episode.stillPath),
        7.pw,
        EpisodeInfo(episode: episode)
      ],
    );
  }
}