import 'package:flutter/material.dart';
import 'package:mo3tv/features/media/domain/entities/episode.dart';
import 'package:mo3tv/features/media/presentation/widgets/tv_show_season_screens_widgets/episodes_widgets/episode_card_widgets/episodes_card.dart';
class EpisodesList extends StatelessWidget {
  final List<Episode> episodes;
  const EpisodesList({super.key, required this.episodes});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: episodes.length,
      shrinkWrap: true,
      itemBuilder: (context, index) =>EpisodeCard(episode: episodes[index])
    );
  }
}