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
  const MovieButtonsWidget({super.key,required this.movie, this.listType=''});
  @override
  State<MovieButtonsWidget> createState() => _MovieButtonsWidgetState();
}

class _MovieButtonsWidgetState extends State<MovieButtonsWidget> with SingleTickerProviderStateMixin{
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
          15.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              UserScoreWidget(vote: widget.movie.voteAverage),
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