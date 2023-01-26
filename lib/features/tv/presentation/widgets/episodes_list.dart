import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/tv/domain/entities/episode.dart';

class EpisodesList extends StatelessWidget {
  final List<Episode> episodes;
  const EpisodesList({Key? key, required this.episodes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: episodes.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(
              horizontal: 7, vertical: 10),
          margin: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(episodes[index].stillPath !=null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                        width: 170,
                        imageUrl: EndPoints.posterUrl(episodes[index]
                            .stillPath!)),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        if (episodes[index]
                            .name !=
                            "Episode ${episodes[index].episodeNumber}")
                          Text(
                            "Episode ${episodes[index].episodeNumber}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                        const SizedBox(
                          height: 4,
                        ),
                        FittedBox(
                            child: Text(
                              "${episodes[index].name}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.visible),
                              maxLines: null,
                            )),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                            "${episodes[index].airDate}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w600)),
                        const SizedBox(
                          height: 4,
                        ),
                        if(episodes[index].runtime!=null)
                        Text(
                          "${episodes[index].runtime! ~/ 60 > 0 ? "${episodes[index].runtime! ~/ 60}h " : ''}${episodes[index].runtime! % 60==0?'':"${episodes[index].runtime! % 60}m"}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                episodes[index].overview!,
                style:
                const TextStyle(fontWeight: FontWeight.w500),
              )
            ],
          ),
        );
      },
    );
  }
}
