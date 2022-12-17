import 'package:flutter/material.dart';
import 'package:mo3tv/core/entities/keyword.dart';
import 'package:mo3tv/core/widgets/play_media_trailer.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/season_poster.dart';

class TvShowDescription extends StatelessWidget {
  final TvShow tvShow;
  final List<Keyword> keywords;
  const TvShowDescription({Key? key, required this.tvShow, required this.keywords}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (tvShow.trailer!=null)
          PlayMediaTrailer(
            url: tvShow.trailer!.key!,
            title: tvShow.trailer!.name!,
          ),
        Text(
          tvShow.overview!,
          style:
          const TextStyle(wordSpacing: 2, height: 1.4, letterSpacing: 1.1),
        ),
        const SizedBox(
          height: 10,
        ),
        if(tvShow.seasons!.isNotEmpty)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Seasons:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 7,
            ),

            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: tvShow.seasons!.map((e) {
                return SeasonPoster(
                  season: e,
                  tvShowId: tvShow.id!,
                  tvShowName: tvShow.originalName!,
                );
              }).toList(),
            ),
          ],
        ),
        if (keywords.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Keywords:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 7,
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                children: keywords.map((e) {
                  return Container(
                      padding: const EdgeInsets.all(6),
                      margin: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.black38.withOpacity(.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(e.name!));
                }).toList(),
              ),
            ],
          ),
        const SizedBox(
          height: 7,
        ),
      ],
    );
  }
}