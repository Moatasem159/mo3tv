import 'package:flutter/material.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/gallery_image.dart';
import 'package:mo3tv/features/gallery/domain/entities/image_entity.dart';
class BackdropsList extends StatelessWidget {
  final List<ImageEntity> backdrops;
  const BackdropsList({Key? key, required this.backdrops}) : super(key: key);
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
                  "Backdrops : ${backdrops.length}",
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
            childCount: backdrops.length,
                (context, index) {
              return GalleryImage(image:backdrops[index]);
            },
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.6,
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 7),
        ),
        SliverToBoxAdapter(child: 70.ph),
      ],
    );
  }
}