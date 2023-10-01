import 'package:flutter/material.dart';
import 'package:mo3tv/core/entities/media.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/list_title.dart';
import 'package:mo3tv/core/widgets/media_list_item/media_list_item.dart';
class MediaHorizontalList extends StatelessWidget {
  final String title;
  final bool isMovie;
  final List<Media> media;
  final VoidCallback? onPressed;
  const MediaHorizontalList({Key? key, required this.title,required this.media, this.onPressed,required this.isMovie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTitle(title: title,onPressed: onPressed),
        10.ph,
        SizedBox(
          height: MediaQuery.sizeOf(context).height/3.9,
          child: ListView.builder(
            itemCount: media.length,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index) =>MediaListItem(media: media[index],isMovie: isMovie))),
        10.ph,
      ],
    );
  }
}