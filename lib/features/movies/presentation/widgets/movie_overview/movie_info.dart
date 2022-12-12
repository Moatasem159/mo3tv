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
          SizedBox(
            width: 150,
            child: Text(
              movie.title!,
              maxLines: null,
              overflow: TextOverflow.visible,
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
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          Text("${(movie.runtime / 60).toInt()}h ${movie.runtime % 60}m "),
          const SizedBox(
            height: 5,
          ),
          const Text("Status"),
          const SizedBox(
            height: 5,
          ),
          Text(movie.status!),
          const SizedBox(
            height: 10,
          ),
          const Text("Release Date"),
          const SizedBox(
            height: 5,
          ),
          Text(
            movie.releaseDate!,
          ),
          const SizedBox(
            height: 10,
          ),
          if (movie.budget != 0)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Budget"),
                const SizedBox(
                  height: 5,
                ),
                Text("\$ ${myFormat.format(movie.budget)}"),
              ],
            ),
          const SizedBox(
            height: 10,
          ),
          if (movie.revenue != 0)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Revenue"),
                const SizedBox(
                  height: 5,
                ),
                Text("\$ ${myFormat.format(movie.revenue)}"),
              ],
            ),
        ],
      ),
    );
  }
}