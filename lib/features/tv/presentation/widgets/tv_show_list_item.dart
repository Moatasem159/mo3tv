import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/widgets/media_loading/media_list_loading_item.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
class TvShowListItem extends StatelessWidget {
  final TvShow tvShow;
  const TvShowListItem({Key? key, required this.tvShow}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        TvCubit.get(context).clearObjects();
        TvCubit.get(context).tvIds.add(tvShow.id!);
        TvCubit.get(context).getTvShowDetailsData(tvShowId: tvShow.id!);
        GoRouter.of(context).pushNamed(Routes.tvShowRoute, extra: tvShow);
      },
      child: CachedNetworkImage(
        imageBuilder: (context, imageProvider) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: 140,
            height:200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                )
            ),
          );
        },
        imageUrl: EndPoints.posterUrl(tvShow.posterPath!),
        placeholder: (context, url) => const MediaListLoadingItem(),
        errorWidget: (context, url, error) => Image.asset("assets/images/movieplaceholder.png"),
      ),
    );
  }
}