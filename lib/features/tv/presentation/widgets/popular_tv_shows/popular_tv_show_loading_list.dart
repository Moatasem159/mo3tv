import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/presentation/widgets/list_title.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_poster_widgets.dart';

class PopularTvShowsLoadingList extends StatelessWidget {
  const PopularTvShowsLoadingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const ListTitle(title: "Popular"),
          SizedBox(
            height: 170.0,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: const TvShowPosterLoading(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}