import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/presentation/widgets/list_title.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_poster_widgets.dart';

class TopRatedTvShowsList extends StatelessWidget {
  final List<TvShow> topRatedTvShow;
  const TopRatedTvShowsList({Key? key, required this.topRatedTvShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: Column(
        children: [
          const ListTitle(title: "Top Rated"),
          SizedBox(
            height: 180.0,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: topRatedTvShow.length,
              itemBuilder: (context,index){
                return Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: TvShowPoster(tvShow:topRatedTvShow[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}