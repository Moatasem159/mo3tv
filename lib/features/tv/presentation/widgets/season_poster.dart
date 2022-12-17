import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/screens/season_details_screen.dart';
import 'package:shimmer/shimmer.dart';

class SeasonPoster extends StatelessWidget {
  final TvShowSeason season;
  final int tvShowId;
  final String tvShowName;
  const SeasonPoster({Key? key,
    required this.season, required this.tvShowId,
    required this.tvShowName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<TvCubit>(context).getTvShowSeasonDetailsData(
            tvShowId: tvShowId,
            seasonNumber:season.seasonNumber!);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  SeasonDetailsScreen(
          season: season,
          tvShowName: tvShowName,

        ),));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            ClipRRect(
              borderRadius:
              const BorderRadius.all(Radius.circular(8.0)),
              child: CachedNetworkImage(
                width:155 ,
                height: 230,
                fit: BoxFit.cover,
                imageUrl: EndPoints.posterUrl(season.posterPath!),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[700]!,
                  highlightColor: Colors.grey[600]!,
                  child: Container(
                    height: 230,
                    width: 155,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Image.asset("assets/images/movieplaceholder.png"),
              ),
            ),
            const SizedBox(height: 7,),
            Container(
              width: 155,
              padding:const EdgeInsets.all(5),
              decoration:const BoxDecoration(
                  color:Colors.black87,
                  borderRadius:BorderRadius.vertical(bottom: Radius.circular(8))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(season.name!,style:const TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                  Text(
                    season.airDate!=''?
                    "${season.airDate!.substring(0,4)} | ${season.episodeCount} Episodes":
                    "${season.episodeCount} Episodes",
                    maxLines: null,
                    overflow: TextOverflow.visible,
                    style:const TextStyle(
                        height: 1.2,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
