import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/widgets/media_loading/media_list_loading_item.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
class MovieListItem extends StatelessWidget {
  final Movie movie;
  const MovieListItem({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> GoRouter.of(context).pushNamed(Routes.movieDetailsRoute,extra:movie),
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
        imageUrl: EndPoints.posterUrl(movie.posterPath!),
        placeholder: (context, url) => const MediaListLoadingItem(),
        errorWidget: (context, url, error) => Image.asset("assets/images/movieplaceholder.png"),
      ),
    );
  }
}