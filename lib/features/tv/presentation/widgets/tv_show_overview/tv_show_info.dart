import 'package:flutter/material.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';

class TvShowInfo extends StatelessWidget {
  final TvShow tvShow;

  const TvShowInfo({Key? key, required this.tvShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${tvShow.originalName!} (${tvShow.firstAirDate!.substring(0,4)}) ",
            maxLines: null,
            overflow: TextOverflow.visible,
            style:const TextStyle(
              height: 1.2,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          if (tvShow.tagline != "")
            Column(
              children: [
                SizedBox(
                  width: 140,
                  child: Text(
                    tvShow.tagline!,
                    maxLines: null,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          if(tvShow.seasons!.isEmpty&&tvShow.numberOfSeasons==1)
            Text("${tvShow.numberOfSeasons} Season",style:const TextStyle(
                fontWeight: FontWeight.bold
            ),),
          if(tvShow.seasons!.isEmpty&&tvShow.numberOfSeasons! > 1)
            Text("${tvShow.numberOfSeasons} Seasons",style:const TextStyle(
                fontWeight: FontWeight.bold
            ),),
          if(tvShow.seasons!.length>1)
          Text("${tvShow.seasons!.length} Seasons",style:const TextStyle(
              fontWeight: FontWeight.bold
          ),),
          if(tvShow.seasons!.length==1)
            Text("${tvShow.seasons!.length} Season",style:const TextStyle(
                fontWeight: FontWeight.bold
            ),),
          const SizedBox(
            height: 5,
          ),
          const Text("Status",style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
          const SizedBox(
            height: 4,
          ),
          Text(tvShow.status!),
          const SizedBox(
            height: 6,
          ),
          const Text("Type",style:  TextStyle(
              fontWeight: FontWeight.bold
          ),),
          const SizedBox(
            height: 4,
          ),
          Text(tvShow.type!),
          const SizedBox(height: 7,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:tvShow.createdBy!.map((e){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(e.name!,style: const TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                  const Text("Creator"),
                  const SizedBox( height: 7,)
                ],
              );
            }).toList(),
          ),

        ],
      ),
    );
  }
}