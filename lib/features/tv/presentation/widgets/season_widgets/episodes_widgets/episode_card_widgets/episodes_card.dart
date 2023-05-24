import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/tv/domain/entities/episode.dart';
import 'package:mo3tv/features/tv/presentation/widgets/season_widgets/episodes_widgets/episode_card_widgets/episode_details.dart';
class EpisodeCard extends StatelessWidget {
  final Episode episode;
  const EpisodeCard({super.key,required this.episode});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          EpisodeDetails(episode: episode),
          5.ph,
          Text(episode.overview!,style: AppTextStyles.get14NormalText())
        ],
      ),
    );
  }
}