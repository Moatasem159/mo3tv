import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/core/utils/app_text_styles.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_list_cubit/search_list_cubit.dart';
import 'package:shimmer/shimmer.dart';
class MovieSearchWidget extends StatelessWidget {
  final Search movie;
  const MovieSearchWidget({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        SearchListCubit.get(context).saveSearch(search: movie);
        Movie m=Movie(
          id: movie.id,
          title: movie.originalTitle,
          posterPath: movie.posterPath,
          backdropPath: movie.backdropPath,
        );
        GoRouter.of(context).pushNamed(Routes.movieDetailsRoute,extra:m);
      } ,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical:10),
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black26,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            CachedNetworkImage(
              width: 120,
              height:180,
              imageUrl: EndPoints.posterUrl(movie.posterPath!),
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: imageProvider,
                      fit: BoxFit.cover
                    )
                  ),
                );
              },
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[850]!,
                highlightColor: Colors.grey[800]!,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            10.pw,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                   Text("${movie.originalTitle} ${movie.releaseDate==""?'':((movie.releaseDate!.substring(0,4)))}",
                     style: AppTextStyles.get14BoldText(),
                     maxLines: 3,
                     overflow: TextOverflow.ellipsis,
                   ),
                  7.ph,
                  if(movie.voteAverage!=0)
                  Row(
                    children:  [
                      const Icon(Icons.star,color: Colors.yellow,),
                      5.pw,
                      Text("${movie.voteAverage!.toStringAsFixed(1)}",style: AppTextStyles.get14BoldText(),)
                    ],
                  ),
                  7.ph,
                   Row(
                    children: [
                      Text("IN MOVIES",style:AppTextStyles.get14BoldText()),
                      5.pw,
                      const Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Icon(Icons.movie_filter_rounded,size: 18),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}