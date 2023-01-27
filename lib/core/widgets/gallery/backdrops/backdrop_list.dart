import 'package:flutter/material.dart';
import 'package:mo3tv/core/entities/image.dart';
import 'package:mo3tv/core/widgets/gallery/gallery_image.dart';


class BackdropsList extends StatelessWidget {
  final   List<ImageEntity> backdrops;
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
              const SizedBox(
                height: 10,
              )
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
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 70,
          ),
        ),
      ],
    );
  }
}