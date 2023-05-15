import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:shimmer/shimmer.dart';
class EpisodeImage extends StatelessWidget {
  final String image;
  const EpisodeImage({super.key,required this.image});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        width: 170,
        height: 100,
        imageUrl: EndPoints.posterUrl(image),
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: imageProvider)
          ),
        );
      },
      placeholder: (context, url) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[850]!,
          highlightColor: Colors.grey[800]!,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey,
              borderRadius: BorderRadius.circular(10)
            ),

          ),
        );
      },
        errorWidget: (context, url, error) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage("assets/images/movieplaceholder.png")
              )
            ),
          );
        });
  }
}