import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/entities/keyword.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';

class MovieDescription extends StatelessWidget {
  final Movie movie;
  final List<Keyword> keywords;

  const MovieDescription({Key? key, required this.movie, required this.keywords})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.overview!,
          style:
          const TextStyle(wordSpacing: 2, height: 1.4, letterSpacing: 1.1),
        ),
        const SizedBox(
          height: 10,
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
        if (movie.productionCompanies!.isNotEmpty)
          Column(
            children: [
              const Center(child: Text("Production Companies")),
              const SizedBox(
                height: 7,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                children: movie.productionCompanies!.map((e)=> SizedBox(
                  width: 170,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CachedNetworkImage(
                        width: 90,
                        height: 70,
                        imageUrl: EndPoints.logoUrl(
                            e.logoPath),
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images/movieplaceholder.png"),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      FittedBox(
                          child: Text(e.name)),
                    ],
                  ),
                )
                ).toList(),
              ),
            ],
          ),
      ],
    );
  }
}