import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/movies/domain/entities/image.dart';
import 'package:shimmer/shimmer.dart';

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
              return CachedNetworkImage(
                  imageUrl: EndPoints.backDropsUrl(
                      backdrops[index].filePath!),
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[700]!,
                    highlightColor: Colors.grey[600]!,
                    child: Container(
                      color: Colors.black,
                    ),
                  )
              );
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
            height: 10,
          ),
        ),
        // SliverToBoxAdapter(
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: ElevatedButton(
        //       child: const Text("Load more"),
        //       onPressed: () {
        //
        //       },
        //     ),
        //   ),
        // ),
      ],
    );
  }
}