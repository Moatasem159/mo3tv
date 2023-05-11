import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_poster/tv_image_place_holder.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_poster/tv_show_poster_builder.dart';
class TvShowPosterWidget extends StatelessWidget {
  const TvShowPosterWidget({super.key,required this.tvShow});
  final TvShow tvShow;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag:tvShow,
      child: CachedNetworkImage(
          imageUrl: EndPoints.posterUrl(tvShow.posterPath!),
          height: 300,
          width: 200,
          imageBuilder:(context, imageProvider) =>TvShowPosterBuilder(poster: imageProvider),
          placeholder: (context, url) => const TvShowImagePlaceHolder(),
          errorWidget: (context, url, error) => Image.asset("assets/images/movieplaceholder.png")
      ),
    );
  }
}



