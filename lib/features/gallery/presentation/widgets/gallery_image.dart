import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/image_dialog.dart';
import 'package:mo3tv/features/gallery/domain/entities/image_entity.dart';
import 'package:shimmer/shimmer.dart';
class GalleryImage extends StatelessWidget {
  final ImageEntity image;
  const GalleryImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) {
            return ImageDialog(
              link:image.filePath!,
              as:image.aspectRatio,
            );
          },
        );
      },
      child: CachedNetworkImage(
          imageUrl: EndPoints.posterUrl(image.filePath!),
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[700]!,
            highlightColor: Colors.grey[600]!,
            child: Container(color: Colors.black),
          ),
        errorWidget:(context,url,error)=>SvgPicture.network(EndPoints.backDropsUrl(image.filePath!))),
    );
  }
}