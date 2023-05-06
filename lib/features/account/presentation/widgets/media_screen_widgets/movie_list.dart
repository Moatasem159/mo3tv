import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_list_item.dart';
class MovieList extends StatelessWidget {
  final List<Movie> movieList;
  const MovieList({super.key, required this.movieList});
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: movieList.length,
            (context, index) {
          return MovieListItem(movie: movieList[index]);
        },
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: .65,
          crossAxisCount: 3,
          mainAxisSpacing: 7),
    );
  }
}