import 'package:flutter/material.dart';
import 'package:mo3tv/core/entities/keyword.dart';
import 'package:mo3tv/core/widgets/keywords_widgets/keyword_list_widget.dart';
import 'package:mo3tv/core/widgets/play_media_trailer.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/season_widgets/season_poster_widgets/season_poster.dart';
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
          style: const TextStyle(
            wordSpacing: 2,
            height: 1.4,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height:10),
        if(tvShow.seasons!.isNotEmpty)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Seasons:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height:7),
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
        KeywordListWidget(keywords:keywords),
        const SizedBox(height:7),
      ],
    );
  }
}