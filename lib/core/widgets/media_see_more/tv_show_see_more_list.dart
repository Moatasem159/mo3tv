import 'package:flutter/material.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_poster_widget.dart';
class TvShowsSeeMoreList extends StatelessWidget {
  final List<TvShow> tvShows;
  const TvShowsSeeMoreList({
    Key? key,
    required this.tvShows,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(
            childCount:tvShows.length ,
                (context,index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TvShowPoster(tvShow: tvShows[index],),
              );
            }
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 0,
            mainAxisExtent: 165,
            mainAxisSpacing: 7
        ));
  }
}