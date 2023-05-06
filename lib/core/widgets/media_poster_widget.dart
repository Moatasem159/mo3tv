import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:shimmer/shimmer.dart';
class MediaPosterWidget extends StatelessWidget {
  final String poster;
  const MediaPosterWidget({Key? key, required this.poster}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: EndPoints.posterUrl(poster),
        width: 200,
        height: 300,
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[800]!,
              child: Container(
                height: 170.0,
                width: 120.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
        errorWidget: (context, url, error) => Image.asset("assets/images/movieplaceholder.png")
      ),
    );
  }
}