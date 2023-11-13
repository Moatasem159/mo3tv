import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/extension/custom_padding_extension.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
class SeasonScreenAppBar extends StatelessWidget {
  final SliverOverlapAbsorberHandle appBar;
  final TvShowSeason season;
  final String tvShowName;
  const SeasonScreenAppBar({super.key,required this.appBar,required this.season,required this.tvShowName});
  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: appBar,
      sliver: SliverAppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        pinned: true,
        expandedHeight: 540,
        flexibleSpace: Hero(
          tag: "hero${season.posterPath}",
          child: ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                  Colors.black,
                  Colors.transparent,
                ],
                stops: [0, 0.3, 0.5, 1],
              ).createShader(
                Rect.fromLTRB(0, 0, rect.width, rect.height),
              );
            },
            blendMode: BlendMode.dstATop,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: EndPoints.backDropsUrl(season.posterPath),
            ),
          ),
        ),
        bottom: PreferredSize(
            preferredSize: const Size(0, 60),
            child: FittedBox(
              child: Column(
                children: [
                  Text(
                    tvShowName,
                    style: AppTextStyles.get14BoldText()
                  ),
                  Text(
                    season.name,
                    style: AppTextStyles.get14BoldText()
                  ),
                  Text(
                    "(${season.airDate.substring(0, 4)})",
                    style: AppTextStyles.get14BoldText(),
                  ),
                ],
              ).addAllPadding(5)))));
  }
}