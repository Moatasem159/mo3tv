import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/user_score_widget.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_buttons/add_tv_show_to_watchlist_button.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_buttons/tv_show_fav_button.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_buttons/tv_show_rating_button.dart';
class TvShowButtonsWidget extends StatefulWidget {
  final TvShow tvShow;
  const TvShowButtonsWidget({super.key,required this.tvShow});

  @override
  State<TvShowButtonsWidget> createState() => _TvShowButtonsWidgetState();
}

class _TvShowButtonsWidgetState extends State<TvShowButtonsWidget> with SingleTickerProviderStateMixin{
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_fadeController);
    _fadeController.forward();
  }
  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Column(
        children: [
          30.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              UserScoreWidget(vote:widget.tvShow.voteAverage),
              const TvShowFavButton(),
              const TvShowRatingButton(),
              const AddTvShowToWatchlistButton(),
            ],
          ),
        ],
      ),
    );
  }
}