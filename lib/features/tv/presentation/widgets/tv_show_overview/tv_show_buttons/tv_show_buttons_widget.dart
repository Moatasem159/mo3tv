import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/user_score_widget.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_buttons/add_tv_show_to_watchlist_button.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_buttons/tv_show_fav_button.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_buttons/tv_show_rating_button.dart';
class TvShowButtonsWidget extends StatelessWidget {
  final TvShow tvShow;
  const TvShowButtonsWidget({super.key,required this.tvShow});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        15.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            UserScoreWidget(vote:tvShow.voteAverage),
            TvShowFavButton(tvShow: tvShow),
            TvShowRatingButton(tvShow: tvShow,),
            AddTvShowToWatchlistButton(tvShow: tvShow),
          ],
        ),
      ],
    );
  }
}