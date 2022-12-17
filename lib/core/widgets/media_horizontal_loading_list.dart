import 'package:flutter/material.dart';
import 'package:mo3tv/core/widgets/list_title.dart';
import 'package:mo3tv/core/widgets/media_poster_loading.dart';


class MediaHorizontalLoadingList extends StatelessWidget {
  final String title;
  const MediaHorizontalLoadingList({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          ListTitle(title: title),
          SizedBox(
            height: 170.0,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount:5,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: const MediaPosterLoading(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}