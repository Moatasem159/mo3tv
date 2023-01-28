import 'package:flutter/material.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_poster_widget.dart';
class MoviesSeeMoreList extends StatelessWidget {
 final List<Movie> movies;
  const MoviesSeeMoreList({
    Key? key,
    required this.movies,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(
            childCount:movies.length ,
                (context,index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: MoviePoster(movie: movies[index],),
              );
            }
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 0,
            mainAxisExtent: 165,
            mainAxisSpacing: 7
        ));
  }
}