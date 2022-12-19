import 'package:flutter/material.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_buttons/add_tv_show_to_watchlist_button.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_buttons/tv_show_fav_button.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_buttons/tv_show_rating_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TvShowButtons extends StatelessWidget {
  final TvShow tvShow;

  const TvShowButtons({Key? key, required this.tvShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircularPercentIndicator(
                    radius: 21,
                    lineWidth: 3,
                    percent: tvShow.voteAverage / 10,
                    center: Text(
                      "${((tvShow.voteAverage) * 10).toInt() % 10000}%",
                      style: const TextStyle(fontSize: 11),
                    ),
                    progressColor: Colors.green,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("User"),
                      Text("Score"),
                    ],
                  )
                ],
              ),
            ),
            TvShowFavButton(tvShow: tvShow),
            TvShowRatingButton(tvShow: tvShow,),
            AddTvShowToWatchlistButton(tvShow: tvShow),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}