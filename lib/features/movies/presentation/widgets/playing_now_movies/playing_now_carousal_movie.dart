import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/playing_now_movies/playing_now_movie_card.dart';
class PlayingNowMoviesCarousal extends StatelessWidget {
  final List<Movie> movies;
  const PlayingNowMoviesCarousal({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height/3.5,
        viewportFraction: .89,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
      ),
      items:movies.map((e)=>PlayingNowMovieCard(movie: e,) ).toList(),
    );
  }
}