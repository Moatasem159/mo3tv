import 'package:flutter/material.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
class SeasonInfo extends StatelessWidget {
  final TvShowSeason season;
  const SeasonInfo({super.key,required this.season});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      padding:const EdgeInsets.all(5),
      decoration:const BoxDecoration(
          color:Colors.black54,
          borderRadius:BorderRadius.vertical(bottom: Radius.circular(10))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(season.name!, style: const TextStyle(fontWeight: FontWeight.bold)),
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
    );
  }
}