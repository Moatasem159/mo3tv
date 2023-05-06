import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
class MovieInfo extends StatelessWidget {
  final Movie movie;
  const MovieInfo({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${movie.title!} ${movie.releaseDate==""?'':((movie.releaseDate!.substring(0, 4)))}",
            maxLines: null,
            overflow: TextOverflow.visible,
            style:const TextStyle(
                height: 1.2,
                fontWeight: FontWeight.bold
            ),
          ),
          if (movie.tagline != "")
          Column(
              children: [
              5.ph,
              SizedBox(
                  width: 140,
                  child: Text(
                    movie.tagline!,
                    maxLines: null,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          5.ph,
          const Text("Status",style:TextStyle(fontWeight: FontWeight.bold)),
          4.ph,
          Text(movie.status!),
          7.ph,
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Budget",style:TextStyle(fontWeight: FontWeight.bold)),
                if (movie.budget != 0)
                  5.ph,
                Text(movie.budget!=0?"\$ ${myFormat.format(movie.budget)}":"------"),
              ],
            ),
          7.ph,
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Revenue",style:TextStyle(fontWeight: FontWeight.bold)),
                if (movie.revenue != 0)
                  5.ph,
                Text(movie.revenue!=0?"\$ ${myFormat.format(movie.revenue)}":"------"),
              ],
            ),
        ],
      ),
    );
  }
}