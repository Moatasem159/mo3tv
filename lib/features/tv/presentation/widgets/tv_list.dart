import 'package:flutter/material.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_list_item.dart';
class TvList extends StatelessWidget {
  final List<TvShow>tvList;
  const TvList({super.key, required this.tvList});
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount:tvList.length,
            (context, index) {
          return TvShowListItem(
              tvShow: tvList[index]);
        },
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: .69,
          crossAxisCount: 3,
          mainAxisSpacing: 7),
    );
  }
}