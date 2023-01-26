import 'package:flutter/material.dart';
import 'package:mo3tv/features/tv/presentation/widgets/playing_now_tv_shows/playing_now_tv_shows.dart';
class TvAppbar extends StatelessWidget {
  final SliverOverlapAbsorberHandle handle;

  const TvAppbar({Key? key, required this.handle,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: handle,
      sliver: SliverPersistentHeader(
        pinned: true,
        delegate: PlayingNowTvShows(),),
    );
  }
}