import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/gallery_image.dart';
import 'package:mo3tv/features/gallery/domain/entities/image_entity.dart';
class MediaLogosList extends StatelessWidget {
  final List<ImageEntity> logos;
  const MediaLogosList({Key? key, required this.logos}) : super(key: key);
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
                  "Logos : ${logos.length}",
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
            childCount: logos.length,
                (context, index) {
                  return GalleryImage(image:logos[index]);
          }

        ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.5,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 7),
        ),
        SliverToBoxAdapter(child: 65.ph),
      ],
    );
  }
}