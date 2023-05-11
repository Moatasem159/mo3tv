import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_poster/movie_image_place_holder.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_poster/movie_poster_builder.dart';
class MoviePosterWidget extends StatelessWidget {
  const MoviePosterWidget({super.key,required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag:movie,
      child: CachedNetworkImage(
          imageUrl: EndPoints.posterUrl(movie.posterPath!),
          height: 300,
          width: 200,
          imageBuilder:(context, imageProvider) =>MoviePosterBuilder(poster: imageProvider),
          placeholder: (context, url) => const MovieImagePlaceHolder(),
          errorWidget: (context, url, error) => Image.asset("assets/images/movieplaceholder.png")
      ),
    );
  }
}



