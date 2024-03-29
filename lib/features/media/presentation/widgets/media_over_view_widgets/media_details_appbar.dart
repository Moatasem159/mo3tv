import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/features/media/presentation/widgets/media_over_view_widgets/media_play_button.dart';
class MediaDetailsAppBar extends SliverPersistentHeaderDelegate {
  final Media media;
  final VoidCallback onTap;
  final VoidCallback onBackTap;
  final String mediaType;
  MediaDetailsAppBar({required this.media,required this.onTap,required this.onBackTap,required this.mediaType});
  final double maxSize = 200;
  final double minSize = 70;
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent){
   const double maxImageSize = 200;
    const double minImageSize = 70;
    const double maxTitleSize = 20;
    const double minTitleSize = 15;
    const double maxIconSize = 20;
    const double mixIconSize = 15;
    const double minImageMargin = 60;
    final p = shrinkOffset / maxSize;
    var screenSize = MediaQuery.of(context).size;
    final imageHeight = (maxImageSize * (1 - p)).clamp(minImageSize, maxImageSize);
    final imageMargin = (minImageMargin * (p));
    final imageRadius = 15 * p;
    final iconSize = (maxIconSize * (1 - p)).clamp(mixIconSize, maxIconSize);
    final titleSize = (maxTitleSize * (1 - p)).clamp(minTitleSize, maxTitleSize);
    const maxTitleMargin = 174.0;
    const textTopMovement = 195;
    const textLeftMovement = 50;
    final maxMargin = screenSize.width / 30;
    final textTop = maxTitleMargin + (1 - textTopMovement * p);
    final textLeft = maxMargin + (textLeftMovement * p);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.black,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                bottom: 0,
                left: imageMargin,
                height: imageHeight,
                child: Container(
                  width: screenSize.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(imageRadius),
                          topLeft: Radius.circular(imageRadius)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          EndPoints.backDropsUrl(media.backdropPath),
                        ),
                      )),
                )),
            Positioned(
                left: 15,
                top: 5,
                child: GestureDetector(
                    onTap: onBackTap,
                    child: Container(
                      width: iconSize,
                      height: iconSize,
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
                left: textLeft,
                top: textTop,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 260,
                  ),
                  child: FittedBox(
                    child: Text(
                      media.originalName,
                      maxLines: null,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontSize: titleSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )),
            Positioned(
                top: maxSize - shrinkOffset-46/2,
                right: 25,
                child:MediaPlayButton(shrinkOffset: shrinkOffset,mediaType: mediaType))
          ],
        ),
      ),
    );
  }
  @override
  double get maxExtent => maxSize;
  @override
  double get minExtent => minSize;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}