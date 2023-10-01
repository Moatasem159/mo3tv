import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/list_title.dart';
import 'package:mo3tv/core/widgets/media_list_item/media_list_loading_item.dart';
class MediaLoadingList extends StatelessWidget {
  final String title;
  const MediaLoadingList({Key? key,required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTitle(title: title),
        10.ph,
        SizedBox(
          height: MediaQuery.sizeOf(context).height/3.9,
          child: ListView.builder(
            itemCount: 20,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>const MediaListLoadingItem())),
        10.ph
      ],
    );
  }
}