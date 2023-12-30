import 'package:flutter/material.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_horizontal_list_widgets/media_list_item/media_list_item.dart';
class MediaVerticalList extends StatelessWidget {
  final List<Media> mediaList;
  final String mediaType;
  final String listType;
  const MediaVerticalList({super.key, required this.mediaList,this.listType='?', required this.mediaType});
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: .65,
          crossAxisCount: 3,
          mainAxisSpacing: 7),
      delegate: SliverChildBuilderDelegate(childCount: mediaList.length,
        (context, index) =>MediaListItem(media: mediaList[index],listType:listType,mediaType:mediaType)));
  }
}