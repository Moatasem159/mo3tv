import 'package:flutter/material.dart';
import 'package:mo3tv/core/entities/image.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/widgets/gallery/gallery_image.dart';
class MediaPostersList extends StatelessWidget {
  final List<ImageEntity> posters;
  const MediaPostersList ({Key? key, required this.posters}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Text(
                  "Posters : ${posters.length}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              10.ph
            ],
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: posters.length,
                (context, index) {
              return GalleryImage(image:posters[index]);
            },
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              mainAxisExtent: 130,
              crossAxisCount: 4,
              mainAxisSpacing: 7,
              crossAxisSpacing: 5),
        ),
         SliverToBoxAdapter(child: 70.ph),
      ],
    );
  }
}