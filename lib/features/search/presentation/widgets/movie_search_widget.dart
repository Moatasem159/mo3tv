import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
class MovieSearchWidget extends StatelessWidget {
  final Search movie;
  const MovieSearchWidget({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> GoRouter.of(context).pushNamed(Routes.movieDetailsRoute,extra:movie),
      child: Container(
        width:20,
        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black26,
        ),
        height: 140,
        child: Row(
          children:  [
            CachedNetworkImage(
              width: 120,
              height:140,
              imageUrl: EndPoints.posterUrl(movie.posterPath!),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                   Text("${movie.originalTitle} ${movie.releaseDate==""?'':((movie.releaseDate!.substring(0,4)))}",style: const TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                  4.ph,
                  if(movie.voteAverage!=0)
                  Row(
                    children:  [
                      const Icon(Icons.star,color: Colors.yellow,),
                      5.pw,
                      Text("${movie.voteAverage!}")
                    ],
                  ),
                  7.ph,
                  const Text("in Movies"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}