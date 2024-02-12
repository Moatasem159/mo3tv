import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_assets.dart';
import 'package:shimmer/shimmer.dart';
part 'poster_image_builder.dart';
part 'poster_placeholder.dart';
class MediaPoster extends StatefulWidget {
  final String image;
  const MediaPoster({super.key,required this.image});
  @override
  State<MediaPoster> createState() => _MoviePosterWidgetState();
}
class _MoviePosterWidgetState extends State<MediaPoster> with SingleTickerProviderStateMixin{
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
    _curveAnimations.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideTransition,
      child: CachedNetworkImage(
          height: MediaQuery.sizeOf(context).height/2.79,
          width: MediaQuery.sizeOf(context).width/2,
          imageUrl: EndPoints.posterUrl(widget.image),
          imageBuilder:(context, imageProvider) =>_PosterImageBuilder(poster: imageProvider),
          placeholder: (context, url) => const _PosterPlaceHolder(),
          errorWidget: (context, url, error) => Image.asset(AppAssets.errorCover)
      ),
    );
  }
}