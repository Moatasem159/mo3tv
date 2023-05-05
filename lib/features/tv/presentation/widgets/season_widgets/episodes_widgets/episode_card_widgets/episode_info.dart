import 'package:flutter/material.dart';
import 'package:mo3tv/features/tv/domain/entities/episode.dart';
class EpisodeInfo extends StatelessWidget {
  final Episode episode;
  const EpisodeInfo({super.key,required this.episode});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          if (episode.name != "Episode ${episode.episodeNumber}")
            Text(
              "Episode ${episode.episodeNumber}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold),
            ),
          const SizedBox(height:4),
          FittedBox(
              child: Text(
                "${episode.name}",
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.visible),
                maxLines: null,
              )),
          const SizedBox(height:4),
          Text(
              "${episode.airDate}",
              style: const TextStyle(
                  fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          if(episode.runtime!=null)
            Text(
              "${episode.runtime! ~/ 60 > 0 ? "${episode.runtime! ~/ 60}h " : ''}${episode.runtime! % 60==0?'':"${episode.runtime! % 60}m"}",
              style: const TextStyle(
                  fontWeight: FontWeight.w600),
            )
        ],
      ),
    );
  }
}