import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';

class ProductionCompanyWidget extends StatelessWidget {
  final ProductionCompany company;
  const ProductionCompanyWidget({Key? key, required this.company}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CachedNetworkImage(
            width: 90,
            height: 70,
            imageUrl: EndPoints.logoUrl(
                company.logoPath),
            errorWidget: (context, url, error) =>
                Image.asset("assets/images/movieplaceholder.png"),
          ),
          const SizedBox(
            height: 5,
          ),
          FittedBox(
              child: Text(company.name)),
        ],
      ),
    );
  }
}