import 'package:flutter/material.dart';
import 'package:mo3tv/core/widgets/genres_widget.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/network_list_widget.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_details_body.dart';

class TvShowDetails extends StatelessWidget {
  final TvShow tvShow;
  const TvShowDetails({Key? key, required this.tvShow}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TvShowDetailsBody(tvShow: tvShow,),
        if (tvShow.genres!.isNotEmpty)
          GenresWidget(genres: tvShow.genres!,
              isTvShow: true,
              runTime: tvShow.episodeRunTime!.isNotEmpty ? tvShow
                  .episodeRunTime![0]:0),
        const SizedBox(
          height: 20
        ),
        if(tvShow.networks!.isNotEmpty)
          NetworkListWidget(networks: tvShow.networks!)
      ],
    );
  }
}


