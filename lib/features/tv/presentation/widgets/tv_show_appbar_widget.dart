import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_bottomnav_cubit/tv_show_bottom_nav_cubit.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_play_button.dart';
class TvShowDetailsAppBar extends SliverPersistentHeaderDelegate {
  final TvShow tvShow;
  TvShowDetailsAppBar(this.tvShow);
  final double maxSize = 200;
  final double minSize = 70;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    const double maxImageSize = 200;
    const double minImageSize = 70;
    const double maxTitleSize = 20;
    const double minTitleSize = 15;
    const double maxIconSize = 20;
    const double mixIconSize = 15;
    const double minImageMargin = 60;
    final p = shrinkOffset / maxSize;
    var size = MediaQuery.of(context).size;
    final c = (maxImageSize * (1 - p)).clamp(minImageSize, maxImageSize);
    final iconSize = (maxIconSize * (1 - p)).clamp(mixIconSize, maxIconSize);
    final titleSize = (maxTitleSize * (1 - p)).clamp(minTitleSize, maxTitleSize);
    const maxTitleMargin = 174.0;
    dynamic textMovement = 195;
    final double top = maxTitleMargin + (1 - textMovement * p);
    final maxMargin = size.width / 30;
    const textLeftMovement = 50;
    final left = maxMargin + (textLeftMovement * p);
    final radius = 15 * p;
    final imageMargin = (minImageMargin * (p));
    return GestureDetector(
      onTap: (){
        TvShowBottomNavCubit.get(context)
            .nestedController
            .animateTo(0,
            duration:
            const Duration(milliseconds: 500),
            curve: Curves.ease);
      },
      child: Container(
        color: Colors.black,
        child: Stack(
          clipBehavior: Clip.none,
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
                top:10,
                child: GestureDetector(
                    onTap: () {
                      if(TvShowBottomNavCubit.get(context).index!=0)
                        {
                          TvShowBottomNavCubit.get(context).changeScreen(0, context);
                        }
                      else{
                        GoRouter.of(context).pop();
                      }
                    },
                    child: Container(
                      width: iconSize,
                      height:iconSize,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black12,

                      ),
                      child: Icon(
                        AppLocalizations.of(context)!.isEnLocale?
                        Icons.arrow_back:Icons.arrow_forward,
                        size: iconSize,
                      ),
                    ))),
            Positioned(
                left: left,
                top: top,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
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
                ),
            ),
            Positioned(
                top: maxSize - shrinkOffset-46/2,
                right: 25,
                child: TvShowPlayButton(shrinkOffset: shrinkOffset))
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
