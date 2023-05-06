import 'package:flutter/material.dart';
import 'package:mo3tv/features/tv/domain/entities/episode.dart';
import 'package:mo3tv/features/tv/presentation/widgets/season_widgets/episodes_widgets/episode_card_widgets/episodes_card.dart';
class EpisodesList extends StatelessWidget {
  final List<Episode> episodes;
  const EpisodesList({Key? key, required this.episodes}) : super(key: key);
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