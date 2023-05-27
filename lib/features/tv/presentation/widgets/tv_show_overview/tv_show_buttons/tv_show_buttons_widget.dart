import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/user_score_widget.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_buttons/add_tv_show_to_watchlist_button.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_buttons/tv_show_fav_button.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_buttons/tv_show_rating_button.dart';
class TvShowButtonsWidget extends StatefulWidget {
  final TvShow tvShow;
  final  String listType;
  const TvShowButtonsWidget({super.key,required this.tvShow,this.listType=''});
  @override
  State<TvShowButtonsWidget> createState() => _TvShowButtonsWidgetState();
}

class _TvShowButtonsWidgetState extends State<TvShowButtonsWidget> with SingleTickerProviderStateMixin{
  late AnimationController _slideController;
  late Animation<Offset> _slideTransition;
  late CurvedAnimation _curveAnimations;
  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    _curveAnimations=CurvedAnimation(parent: _slideController, curve: Curves.fastLinearToSlowEaseIn);
    _slideTransition = Tween<Offset>(begin: const Offset(0,6), end: Offset.zero).animate(_curveAnimations);
    _slideController.forward();
  }
  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position:_slideTransition,
      child: Column(
        children: [
          5.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              UserScoreWidget(vote:widget.tvShow.voteAverage),
              TvShowFavButton(listType:widget.listType),
              TvShowRatingButton(listType:widget.listType),
              AddTvShowToWatchlistButton(listType:widget.listType),
            ],
          ),
        ],
      ),
    );
  }
}