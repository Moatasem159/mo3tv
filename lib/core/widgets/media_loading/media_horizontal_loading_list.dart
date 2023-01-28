import 'package:flutter/material.dart';
import 'package:mo3tv/core/widgets/media_poster_loading.dart';


class MediaHorizontalLoadingList extends StatelessWidget {
  const MediaHorizontalLoadingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 370,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount:4,
          itemBuilder: (context, index) {
            return const MediaPosterLoading();
          },
        ),
      ),
    );
  }
}