import 'package:flutter/material.dart';
import 'package:mo3tv/core/widgets/list_title.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_poster_widget.dart';

class HorizontalTvShowsList extends StatelessWidget {
  final List<TvShow> tvShows;
  final String title;
  final VoidCallback onTap;
  const HorizontalTvShowsList({Key? key,
    required this.tvShows,
    required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          ListTitle(
            title: title,
            onPressed: onTap,
          ),
          SizedBox(
            height: 170,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: tvShows.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: TvShowPoster(tvShow:tvShows[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}