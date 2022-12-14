import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_info.dart';
import 'package:shimmer/shimmer.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  const MovieDetails({Key? key, required this.movie}) : super(key: key);

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
                imageUrl: EndPoints.posterUrl(movie.posterPath!),
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
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            MovieInfo(
              movie: movie,
            )
          ],
        ),
        const SizedBox(
          height: 5
        ),
        if (movie.genres!.isNotEmpty)
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
                runSpacing: 5,
                spacing: 7,
                children: movie.genres!.map((e){
                  return Wrap(
                      children: [
                        Text(movie.genres!.last.id !=e.id?
                        "${e.name},": "${e.name}",style:const TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                        if(e.id==movie.genres!.last.id)
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
                              Text("${(movie.runtime / 60).toInt()}h ${movie.runtime % 60}m",style:const TextStyle(
                                fontWeight: FontWeight.bold
                              )),
                            ],)
                      ]
                  );
                }).toList()
            ),
          ),
        const SizedBox(height: 15,)
      ],
    );
  }
}