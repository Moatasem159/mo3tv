import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/entities/media.dart';
import 'package:mo3tv/core/widgets/media_playing_now/media_playing_now_card_builder.dart';
import 'package:mo3tv/core/widgets/media_playing_now/playing_now_media_loading_card.dart';
class MediaPlayingNowCard extends StatelessWidget {
  final Media media;
  final bool isMovie;
  const MediaPlayingNowCard({super.key, required this.media, required this.isMovie});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=>GoRouter.of(context).pushNamed(isMovie?Routes.movieDetailsRoute:Routes.tvShowDetailsRoute,extra: media,pathParameters: {"listType":"?"}),
      child:CachedNetworkImage(
        imageUrl: EndPoints.backDropsUrl(media.backdropPath!),
        imageBuilder: (context, imageProvider) =>MediaPlayingNowCardBuilder(media: media,image: imageProvider),
        placeholder:(context, url) => const PlayingNowMediaLoadingCard()));
  }
}