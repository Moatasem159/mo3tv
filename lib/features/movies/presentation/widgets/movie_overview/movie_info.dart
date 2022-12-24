import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
                const SizedBox(
                  height: 5,
                ),
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
          const SizedBox(
            height: 5,
          ),
          const Text("Status",style:TextStyle(
          fontWeight: FontWeight.bold
          ),),
          const SizedBox(
            height: 4,
          ),
          Text(movie.status!),
          const SizedBox(
            height: 7,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Budget",style:TextStyle(
                    fontWeight: FontWeight.bold
                )),
                if (movie.budget != 0)
                const SizedBox(
                  height: 5,
                ),
                Text(movie.budget!=0?"\$ ${myFormat.format(movie.budget)}":"------"),
              ],
            ),
          const SizedBox(
            height: 7,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Revenue",style:TextStyle(
                    fontWeight: FontWeight.bold
                )),
                if (movie.revenue != 0)
                const SizedBox(
                  height: 5,
                ),
                Text(movie.revenue!=0?"\$ ${myFormat.format(movie.revenue)}":"------"),
              ],
            ),
        ],
      ),
    );
  }
}