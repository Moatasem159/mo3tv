import 'package:flutter/material.dart';
import 'package:mo3tv/features/tv/presentation/widgets/playing_now_tv_shows/playing_now_tv_shows.dart';
class TvAppbar extends StatelessWidget {


  const TvAppbar({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverPersistentHeader(
        pinned: true,
        delegate: PlayingNowTvShows(),),
    );
  }
}