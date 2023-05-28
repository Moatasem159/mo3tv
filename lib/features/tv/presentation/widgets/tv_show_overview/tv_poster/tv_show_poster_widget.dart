import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_assets.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_poster/tv_image_place_holder.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_poster/tv_show_poster_builder.dart';
class TvShowPosterWidget extends StatefulWidget {
  const TvShowPosterWidget({super.key,required this.tvShow});
  final TvShow tvShow;
  @override
  State<TvShowPosterWidget> createState() => _TvShowPosterWidgetState();
}
class _TvShowPosterWidgetState extends State<TvShowPosterWidget>with SingleTickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<Offset> _slideTransition;
  late CurvedAnimation _curveAnimations;
  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    _curveAnimations=CurvedAnimation(parent: _slideController, curve: Curves.fastLinearToSlowEaseIn);
    _slideTransition = Tween<Offset>(begin: const Offset(0,1), end: Offset.zero).animate(_curveAnimations);
    _slideController.forward();
  }
  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideTransition,
      child: CachedNetworkImage(
          imageUrl: EndPoints.posterUrl(widget.tvShow.posterPath!),
          height: 280,
          width: 180,
          imageBuilder:(context, imageProvider) =>TvShowPosterBuilder(poster: imageProvider),
          placeholder: (context, url) => const TvShowImagePlaceHolder(),
          errorWidget: (context, url, error) => Image.asset(AppAssets.errorCover)
      ),
    );
  }
}