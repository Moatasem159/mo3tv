import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/entities/keyword.dart';
import 'package:mo3tv/core/widgets/play_media_trailer.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:shimmer/shimmer.dart';

class TvShowDescription extends StatelessWidget {
  final TvShow tvShow;
  final List<Keyword> keywords;
  const TvShowDescription({Key? key, required this.tvShow, required this.keywords}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (tvShow.trailer!=null)
          PlayMediaTrailer(
            url: tvShow.trailer!.key!,
            title: tvShow.trailer!.name!,
          ),
        Text(
          tvShow.overview!,
          style:
          const TextStyle(wordSpacing: 2, height: 1.4, letterSpacing: 1.1),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Seasons:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 7,
            ),
            if(tvShow.seasons!.isNotEmpty)
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: tvShow.seasons!.map((e) {
                return Padding(
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
                          imageUrl: EndPoints.posterUrl(e.posterPath!),
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
                            Text(e.name!,style:const TextStyle(
                                fontWeight: FontWeight.bold
                            ),),
                            Text(
                              e.airDate!=''?
                              "${e.airDate!.substring(0,4)} | ${e.episodeCount} Episodes":
                              "${e.episodeCount} Episodes",
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
                );
              }).toList(),
            ),
          ],
        ),
        if (keywords.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Keywords:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 7,
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                children: keywords.map((e) {
                  return Container(
                      padding: const EdgeInsets.all(6),
                      margin: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.black38.withOpacity(.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(e.name!));
                }).toList(),
              ),
            ],
          ),
        const SizedBox(
          height: 7,
        ),
      ],
    );
  }
}