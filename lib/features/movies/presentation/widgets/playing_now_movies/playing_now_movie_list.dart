import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/playing_now_movies/playing_now_movie_widget.dart';

class PlayingNowMoviesList extends StatelessWidget {
  final List<Movie> movies;
  final double height;
  final double width;
  final double iconSize;
  final double playingSize;
  final double titleSize;

  const PlayingNowMoviesList(
      {Key? key,
        required this.movies,
        required this.height,
        required this.width,
        required this.iconSize,
        required this.playingSize,
        required this.titleSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: CarouselSlider(
        options: CarouselOptions(
          height: height,
          viewportFraction: 1,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
        ),
        items:movies.map(
              (movie) =>
              PlayingNowMovieWidget(
                  movie: movie,
                  imageHeight: height,
                  imageWidth: width,
                  iconSize: iconSize,
                  playingSize: playingSize,
                  titleSize: titleSize),
        ).toList(),
      ),
    );
  }
}