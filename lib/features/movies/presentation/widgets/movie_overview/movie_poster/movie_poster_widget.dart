import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_assets.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_poster/movie_image_place_holder.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_poster/movie_poster_builder.dart';
class MoviePosterWidget extends StatefulWidget {
  const MoviePosterWidget({super.key,required this.movie});
  final Movie movie;
  @override
  State<MoviePosterWidget> createState() => _MoviePosterWidgetState();
}
class _MoviePosterWidgetState extends State<MoviePosterWidget> with SingleTickerProviderStateMixin{
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
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideTransition,
      child: CachedNetworkImage(
          height: MediaQuery.sizeOf(context).height/2.79,
          width: MediaQuery.sizeOf(context).width/2,
          imageUrl: EndPoints.posterUrl(widget.movie.posterPath!),
          imageBuilder:(context, imageProvider) =>MoviePosterBuilder(poster: imageProvider),
          placeholder: (context, url) => const MovieImagePlaceHolder(),
          errorWidget: (context, url, error) => Image.asset(AppAssets.errorCover)
      ),
    );
  }
}