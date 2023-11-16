import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/entities/media.dart';
import 'package:mo3tv/core/utils/app_assets.dart';
import 'package:mo3tv/core/widgets/media_list_item/media_image_builder.dart';
import 'package:mo3tv/core/widgets/media_list_item/media_list_loading_item.dart';
class MediaListItem extends StatelessWidget {
  final Media media;
  final bool isMovie;
  final String listType;
  const MediaListItem({super.key, required this.media,this.listType='?',required this.isMovie});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>GoRouter.of(context).pushNamed(isMovie?Routes.movieDetailsRoute:Routes.tvShowDetailsRoute,extra:media,pathParameters:{"listType":listType}),
      child: CachedNetworkImage(
        imageUrl: EndPoints.posterUrl(media.posterPath),
        imageBuilder: (context, imageProvider)=>MediaImageBuilder(image: imageProvider),
        placeholder: (context, url) => const MediaListLoadingItem(),
        errorWidget: (context, url, error) => Image.asset(AppAssets.errorCover)));
  }
}