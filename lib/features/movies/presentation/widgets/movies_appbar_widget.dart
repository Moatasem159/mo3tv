import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/presentation/widgets/playing_now_movies/playing_now_movies.dart';

class MoviesAppbar extends StatelessWidget {
  final SliverOverlapAbsorberHandle handle;

  const MoviesAppbar({Key? key, required this.handle,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: handle,
      sliver: SliverPersistentHeader(
        pinned: true,
        delegate: PlayingNowMovies(),),
    );
  }
}