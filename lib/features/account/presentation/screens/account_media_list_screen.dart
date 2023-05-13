import 'package:flutter/material.dart';
import 'package:mo3tv/features/account/presentation/widgets/media_screen_body.dart';
class AccountMediaListsScreen extends StatelessWidget {
  final String title;
  final bool favMovies;
  final bool ratedMovies;
  final bool moviesWatchlist;
  final bool favTv;
  final bool ratedTv;
  final bool tvWatchlist;
  const AccountMediaListsScreen({
    Key? key,
    required this.title,
    this.favMovies=false,
    this.ratedMovies=false,
    this.moviesWatchlist=false,
    this.favTv=false,
    this.ratedTv=false,
    this.tvWatchlist=false,
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