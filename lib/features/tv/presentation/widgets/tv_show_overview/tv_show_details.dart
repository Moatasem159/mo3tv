import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_info.dart';
import 'package:shimmer/shimmer.dart';

class TvShowDetails extends StatelessWidget {
  final TvShow tvShow;

  const TvShowDetails({Key? key, required this.tvShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: EndPoints.posterUrl(tvShow.posterPath!),
                width: 200,
                height: 300,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Shimmer.fromColors(
                      baseColor: Colors.grey[850]!,
                      highlightColor: Colors.grey[800]!,
                      child: Container(
                        height: 170.0,
                        width: 120.0,
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
            const SizedBox(
              width: 5,
            ),
            TvShowInfo(
              tvShow: tvShow,
            )
          ],
        ),
        const SizedBox(
          height: 5
        ),

        if (tvShow.genres!.isNotEmpty)
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              runSpacing: 5,
              spacing: 7,
              children: tvShow.genres!.map((e){
                return Wrap(
                  children: [
                    Text(tvShow.genres!.last.id !=e.id?
                    "${e.name},": "${e.name}",style:const TextStyle(
                        fontWeight: FontWeight.bold
                    ),),
                    if(e.id==tvShow.genres!.last.id)
                    if(tvShow.episodeRunTime!.isNotEmpty)
                    Wrap(children: [
                      const SizedBox(width:5 ,),
                      const Padding(
                        padding: EdgeInsets.only(top: 7),
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: Colors.white,
                        ),
                      ),
                      const SizedBox(width:5 ,),
                      Text("${tvShow.episodeRunTime![0]}m",
                        style:const TextStyle(fontWeight: FontWeight.bold) ,),
                    ],)
                  ]
                );
              }).toList()
            ),
          ),
        const SizedBox(
          height: 10,
        ),
        if(tvShow.networks!.length==1)
        Column(
          children: [
            const Text("Network",style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(height: 7,),
            CachedNetworkImage(
              width: 170,
              height: 80,
              imageUrl: EndPoints.logoUrl(
                  tvShow.networks![0].logoPath!),
              errorWidget: (context, url, error) =>
                  Image.asset("assets/images/movieplaceholder.png"),
            ),
            const SizedBox(
              height: 5,
            ),
            // FittedBox(child: Text(tvShow.networks![0].name!)),
          ],
        ),
        if(tvShow.networks!.length>1)
          Column(
            children: [
              const Text("Networks",style: TextStyle(
                  fontWeight: FontWeight.bold
              ),),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.5),
                itemCount: tvShow.networks!.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                        width: 90,
                        height: 70,
                        imageUrl: EndPoints.logoUrl(
                            tvShow.networks![index].logoPath!),
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images/movieplaceholder.png"),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // FittedBox(
                      //     child: Text(tvShow.productionCompanies![index].name!)),
                    ],
                  );
                },
              ),
            ],
          )
      ],
    );
  }
}