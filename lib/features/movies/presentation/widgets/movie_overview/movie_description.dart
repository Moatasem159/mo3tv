import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/movies/domain/entities/keyword.dart';
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
          const TextStyle(wordSpacing: 3, height: 1.3, letterSpacing: 1.5),
        ),
        const SizedBox(
          height: 10,
        ),
        if (movie.genres!.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Genre:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 7,
              ),
              Wrap(
                children: movie.genres!.map((e) {
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: Text("Production Companies")),
              const SizedBox(
                height: 7,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.5),
                itemCount: movie.productionCompanies!.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: movie.productionCompanies!.length > 1
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        width: 90,
                        height: 70,
                        imageUrl: EndPoints.logoUrl(
                            movie.productionCompanies![index].logoPath),
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images/movieplaceholder.png"),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      FittedBox(
                          child: Text(movie.productionCompanies![index].name)),
                    ],
                  );
                },
              )
            ],
          ),
      ],
    );
  }
}