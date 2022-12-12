import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/presentation/widgets/playing_now_movies/playing_now_movies.dart';

class MoviesAppbar extends StatelessWidget {


  const MoviesAppbar({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverPersistentHeader(
        pinned: true,
        delegate: PlayingNowMovies(),),
    );
  }
}