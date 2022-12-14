import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_buttons/add_movie_to_watchlist_button.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_buttons/movie_fav_button.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_overview/movie_buttons/rating_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MovieButtons extends StatelessWidget {
  final Movie movie;

  const MovieButtons({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircularPercentIndicator(
                    radius: 21,
                    lineWidth: 3,
                    percent: movie.voteAverage / 10,
                    center: Text(
                      "${((movie.voteAverage) * 10).toInt() % 10000}%",
                      style: const TextStyle(fontSize: 11),
                    ),
                    progressColor: Colors.green,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("User"),
                      Text("Score"),
                    ],
                  )
                ],
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    minimumSize: MaterialStateProperty.all(const Size(45, 45)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100))),
                    backgroundColor:
                    MaterialStateProperty.all(Colors.blueGrey)),
                onPressed: () {},
                child: const Icon(Icons.list)),
            MovieFavButton(movie: movie),
            MovieRatingButton(movie: movie,),
            AddMovieToWatchlistButton(movie: movie),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}