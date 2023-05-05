import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
class EpisodeImage extends StatelessWidget {
  final String image;
  const EpisodeImage({super.key,required this.image});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
          width: 170,
          imageUrl: EndPoints.posterUrl(image)),
    );
  }
}