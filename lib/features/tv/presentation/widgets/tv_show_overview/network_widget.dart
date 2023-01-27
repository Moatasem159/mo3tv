import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/tv/data/models/tv_show_model.dart';

class NetworkWidget extends StatelessWidget {
  final Network network;
  const NetworkWidget({Key? key, required this.network}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedNetworkImage(
            width: 140,
            height: 70,
            imageUrl: EndPoints.logoUrl(
                network.logoPath!),
            errorWidget: (context, url, error) =>
                Image.asset("assets/images/movieplaceholder.png"),
          ),
          const SizedBox(
            height: 5,
          ),
          // FittedBox(
          //     child: Text(tvShow.productionCompanies![index].name!)),
        ],
      ),
    );
  }
}