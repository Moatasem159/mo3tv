import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/user_score_widget.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_buttons/add_movie_to_watchlist_button.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_buttons/movie_fav_button.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_buttons/movie_rating_button.dart';
class MovieButtonsWidget extends StatefulWidget {
  final Movie movie;
  final String listType;
  const MovieButtonsWidget({super.key,required this.movie, this.listType='?'});
  @override
  State<MovieButtonsWidget> createState() => _MovieButtonsWidgetState();
}
class _MovieButtonsWidgetState extends State<MovieButtonsWidget> with SingleTickerProviderStateMixin{
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
      position: _slideTransition,
      child: Column(
        children: [
          15.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              UserScoreWidget(vote: widget.movie.voteAverage!),
              MovieFavButton(listType: widget.listType),
              MovieRatingButton(listType: widget.listType),
              AddMovieToWatchlistButton(listType: widget.listType),
            ],
          ),
        ],
      ),
    );
  }
}