import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_assets.dart';
import 'package:mo3tv/core/widgets/media_loading/media_list_loading_item.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
class TvShowListItem extends StatelessWidget {
  final TvShow tvShow;
  final String listType;
  const TvShowListItem({Key? key, required this.tvShow,this.listType='?'}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=>GoRouter.of(context).pushNamed(Routes.tvShowRoute,
          extra: tvShow,pathParameters: {"listType":listType}),
      child: CachedNetworkImage(
        imageUrl: EndPoints.posterUrl(tvShow.posterPath!),
        imageBuilder: (context, imageProvider) =>Container(
          width: 120,
          height:200,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: imageProvider,fit: BoxFit.cover))),
        placeholder: (context, url) => const MediaListLoadingItem(),
        errorWidget: (context, url, error) => Image.asset(AppAssets.errorCover),
      ),
    );
  }
}