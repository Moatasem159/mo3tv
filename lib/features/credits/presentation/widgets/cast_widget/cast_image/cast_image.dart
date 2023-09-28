import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/credits/presentation/widgets/cast_widget/cast_image/cast_image_builder.dart';
import 'package:mo3tv/features/credits/presentation/widgets/cast_widget/cast_image/cast_image_placeholder.dart';
class CastImage extends StatelessWidget {
  final String image;
  const CastImage({super.key,required this.image});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: EndPoints.posterUrl(image),
      imageBuilder: (context, imageProvider) => CastImageBuilder(imageProvider: imageProvider),
      placeholder: (context, url) =>const CastImagePlaceholder(),
      errorWidget: (context, url, error) => const CastImagePlaceholder(),
    );
  }
}