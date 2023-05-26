import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/widgets/media_loading/media_list_loading_item.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_list_item/movie_image_builder.dart';
class MovieListItem extends StatelessWidget {
  final Movie movie;
  final String listType;
  const MovieListItem({Key? key, required this.movie,this.listType=''}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> GoRouter.of(context).pushNamed(Routes.movieDetailsRoute,extra:movie,queryParameters:
      {
        "listType":listType
      }),
      child: Hero(
        tag:movie,
        child: CachedNetworkImage(
          imageUrl: EndPoints.posterUrl(movie.posterPath!),
          imageBuilder: (context, imageProvider)=>MovieImageBuilder(image: imageProvider),
          placeholder: (context, url) => const MediaListLoadingItem(),
          errorWidget: (context, url, error) => Image.asset("assets/images/movieplaceholder.png"),
        ),
      ),
    );
  }
}