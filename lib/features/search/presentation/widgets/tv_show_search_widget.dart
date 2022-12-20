import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/screens/tv_show_details_screen.dart';

class TvShowSearchWidget extends StatelessWidget {
  final Search tvShow;
  const TvShowSearchWidget({Key? key, required this.tvShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<TvCubit>(context).clearObjects();
        BlocProvider.of<TvCubit>(context).tvIds.add(tvShow.id!);
        BlocProvider.of<TvCubit>(context).getTvShowDetailsData(tvShowId: tvShow.id!);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TvShowDetailsScreen(tvShow: TvShow(
            backdropPath: tvShow.backdropPath,
            originalName: tvShow.originalName,
            id: tvShow.id
          )),));
      },
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
              imageUrl: EndPoints.posterUrl(tvShow.posterPath!),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text("${tvShow.originalName} (${tvShow.firstAirDate!.substring(0,4)})",style: const TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                  const SizedBox(height: 4,),
                  if(tvShow.voteAverage!=0)
                  Row(
                    children:  [
                      const Icon(Icons.star,color: Colors.yellow,),
                      const SizedBox(width: 5,),
                      Text("${tvShow.voteAverage!}")
                    ],
                  ),
                  const SizedBox(height:7,),
                  const Text("in Tv shows"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
