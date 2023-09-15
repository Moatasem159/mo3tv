import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_list_item/movie_list_item.dart';
class MoviesList extends StatelessWidget {
  final List<Movie> movieList;
  final String listType;
  const MoviesList({super.key, required this.movieList,this.listType='?'});
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: .65,
          crossAxisCount: 3,
          mainAxisSpacing: 7),
      delegate: SliverChildBuilderDelegate(childCount: movieList.length,
        (context, index) =>MovieListItem(movie: movieList[index],listType:listType)));
  }
}