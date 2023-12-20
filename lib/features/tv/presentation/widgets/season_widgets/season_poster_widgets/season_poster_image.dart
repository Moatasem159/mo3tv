import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_assets.dart';
import 'package:shimmer/shimmer.dart';
class SeasonPosterImage extends StatelessWidget {
  final String image;
  const SeasonPosterImage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "hero$image",
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: CachedNetworkImage(
          width: MediaQuery.sizeOf(context).width/2.5,
          height: MediaQuery.sizeOf(context).height/3,
          fit: BoxFit.cover,
          imageUrl: EndPoints.backDropsUrl(image),
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[700]!,
            highlightColor: Colors.grey[600]!,
            child: Container(
              height: 230,
              width: 155,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Image.asset(AppAssets.errorCover),
        ),
      ),
    );
  }
}