import 'package:flutter/material.dart';
import 'package:mo3tv/features/account/presentation/widgets/media_screen_widgets/media_screen_body.dart';
class MediaListScreen extends StatelessWidget {
  final String title;
  final bool favMovies;
  final bool ratedMovies;
  final bool moviesWatchlist;
  final bool favTv;
  final bool ratedTv;
  final bool tvWatchlist;
  const MediaListScreen({
    Key? key,
    required this.title,
    required this.favMovies,
    required this.ratedMovies,
    required this.moviesWatchlist,
    required this.favTv,
    required this.ratedTv,
    required this.tvWatchlist,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: MediaScreenBody(
          title: title,
          favMovies: favMovies,
          ratedMovies: ratedMovies,
          moviesWatchlist: moviesWatchlist,
          favTv: favTv,
          ratedTv: ratedTv,
          tvWatchlist: tvWatchlist,
        ),
      ),
    );
  }
}
