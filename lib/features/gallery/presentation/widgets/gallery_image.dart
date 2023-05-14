import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/gallery/domain/entities/image_entity.dart';
import 'package:shimmer/shimmer.dart';
class GalleryImage extends StatelessWidget {
  final ImageEntity image;
  const GalleryImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=>GoRouter.of(context).pushNamed(Routes.imageScreenRoute,queryParameters:{"image":image.filePath}),
      child: Hero(
        tag: image.filePath!,
        child: CachedNetworkImage(
            imageUrl: EndPoints.posterUrl(image.filePath!),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[700]!,
              highlightColor: Colors.grey[600]!,
              child: Container(color: Colors.black),
            ),
          errorWidget:(context,url,error)=>SvgPicture.network(EndPoints.backDropsUrl(image.filePath!))),
      ),
    );
  }
}