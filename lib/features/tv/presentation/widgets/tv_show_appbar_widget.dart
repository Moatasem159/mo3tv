import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
class TvShowDetailsAppBar extends SliverPersistentHeaderDelegate {
  final TvShow tvShow;
  final GestureTapCallback ? onTap;
  TvShowDetailsAppBar(this.tvShow, {this.onTap});
  final double maxSize = 200;
  final double minSize = 70;
  final double maxImageSize = 200;
  final double minImageSize = 70;
  final double maxTitleSize = 20;
  final double minTitleSize = 15;
  final double maxIconSize = 30;
  final double mixIconSize = 20;
  final double maxImageMargin = 0;
  final double minImageMargin = 60;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final p = shrinkOffset / maxSize;
    var size = MediaQuery.of(context).size;
    final c = (maxImageSize * (1 - p)).clamp(minImageSize, maxImageSize);
    final iconSize = (maxIconSize * (1 - p)).clamp(mixIconSize, maxIconSize);
    final titleSize =
        (maxTitleSize * (1 - p)).clamp(minTitleSize, maxTitleSize);
    const maxTitleMargin = 174.0;
    dynamic textMovement = 195;
    final double top = maxTitleMargin + (1 - textMovement * p);
    final maxMargin = size.width / 30;
    const textLeftMovement = 50;
    final left = maxMargin + (textLeftMovement * p);
    final radius = 15 * p;
    final imageMargin = (minImageMargin * (p));
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned(
                bottom: 0,
                left: imageMargin,
                height: c,
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(radius),
                          topLeft: Radius.circular(radius)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          EndPoints.backDropsUrl(tvShow.backdropPath!),
                        ),
                      )),
                )),
            Positioned(
                left: 15,
                top: 5,
                child: GestureDetector(
                    onTap: () {
                      TvCubit.get(context).clearObjects();
                      TvCubit.get(context).backToBackTvShows();
                      GoRouter.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: iconSize,
                    ))),
            Positioned(
                left: left,
                top: top,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 300,
                  ),
                  child: FittedBox(
                    child: Text(
                      tvShow.originalName!,
                      maxLines: null,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontSize: titleSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
    // 4.3
  }
  @override
  double get maxExtent => maxSize;
  @override
  double get minExtent => minSize;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}
