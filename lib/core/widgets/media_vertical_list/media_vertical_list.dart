import 'package:flutter/material.dart';
import 'package:mo3tv/core/entities/media.dart';
import 'package:mo3tv/core/widgets/media_list_item/media_list_item.dart';
class MediaVerticalList extends StatelessWidget {
  final List<Media> mediaList;
  final bool isMovie;
  final String listType;
  const MediaVerticalList({super.key, required this.mediaList,this.listType='?', required this.isMovie});
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: .65,
          crossAxisCount: 3,
          mainAxisSpacing: 7),
      delegate: SliverChildBuilderDelegate(childCount: mediaList.length,
        (context, index) =>MediaListItem(media: mediaList[index],listType:listType,isMovie:isMovie)));
  }
}